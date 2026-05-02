"""
Routes and views for the bottle application.
"""

from bottle import route, view, request, template
from datetime import datetime
import json
import os
import re

# Путь к файлу с данными статей
ARTICLES_FILE = 'articles.json'

def load_articles():
    """Загрузка статей из JSON файла"""
    if os.path.exists(ARTICLES_FILE):
        try:
            with open(ARTICLES_FILE, 'r', encoding='utf-8') as f:
                return json.load(f)
        except:
            return []
    return []

def save_articles(articles):
    """Сохранение статей в JSON файл"""
    with open(ARTICLES_FILE, 'w', encoding='utf-8') as f:
        json.dump(articles, f, ensure_ascii=False, indent=4)

def validate_phone(phone):
    """Валидация номера телефона"""
    pattern = r'^(\+7|8)\s*\(?\d{3}\)?\s*\d{3}[\s-]?\d{2}[\s-]?\d{2}$'
    return re.match(pattern, phone) is not None

def validate_date(date_str):
    """Валидация даты в формате YYYY-MM-DD"""
    try:
        datetime.strptime(date_str, '%Y-%m-%d')
        return True
    except ValueError:
        return False

@route('/')
@route('/home')
@view('index')
def home():
    """Renders the home page."""
    return dict(
        title='Home page',
        year=datetime.now().year
    )

@route('/contact')
@view('contact')
def contact():
    """Renders the bio page."""
    return dict(
        title='Bio',
        message='Your contact page.',
        year=datetime.now().year
    )

@route('/books')
@view('books')
def about():
    """Renders the books page."""
    return dict(
        title='Books',
        message='Your application description page.',
        year=datetime.now().year
    )

@route('/creators')
@view('creators')
def creators():
    return dict(
        title='Contact',
        message='Your application description page.',
        year=datetime.now().year
    )

@route('/articles')
@view('articles')
def articles():
    """Отображение страницы со статьями"""
    articles_list = load_articles()
    articles_list.sort(key=lambda x: x['date'], reverse=True)
    
    return dict(
        title='Полезные статьи',
        message='Страница полезных статей',
        year=datetime.now().year,
        articles=articles_list,
        errors={},
        form_data={}
    )

@route('/articles', method='POST')
@view('articles')
def add_article():
    """Обработка добавления новой статьи"""
    articles_list = load_articles()
    errors = {}
    
    # Получаем данные из формы
    author = request.forms.getunicode('author', '').strip()
    title = request.forms.getunicode('title', '').strip()
    description = request.forms.getunicode('description', '').strip()
    date = request.forms.getunicode('date', '').strip()
    phone = request.forms.getunicode('phone', '').strip()
    
    form_data = {
        'author': author,
        'title': title,
        'description': description,
        'date': date,
        'phone': phone
    }
    
    # Валидация
    if not author:
        errors['author'] = 'Поле Автор обязательно для заполнения'
    elif len(author) < 2:
        errors['author'] = 'Имя автора должно содержать минимум 2 символа'
    
    if not title:
        errors['title'] = 'Поле Наименование статьи обязательно для заполнения'
    elif len(title) < 5:
        errors['title'] = 'Название статьи должно содержать минимум 5 символов'
    
    if not description:
        errors['description'] = 'Поле Описание обязательно для заполнения'
    elif len(description) < 20:
        errors['description'] = 'Описание должно содержать минимум 20 символов'
    
    if not date:
        errors['date'] = 'Поле Дата обязательно для заполнения'
    elif not validate_date(date):
        errors['date'] = 'Дата должна быть в формате ГГГГ-ММ-ДД'
    
    if not phone:
        errors['phone'] = 'Поле Телефон обязательно для заполнения'
    elif not validate_phone(phone):
        errors['phone'] = 'Телефон должен быть в формате +7 (XXX) XXX-XX-XX'
    
    # Если есть ошибки - показываем форму снова с введёнными данными
    if errors:
        articles_list.sort(key=lambda x: x['date'], reverse=True)
        return dict(
            title='Полезные статьи',
            message='Страница полезных статей',
            year=datetime.now().year,
            articles=articles_list,
            errors=errors,
            form_data=form_data
        )
    
    # Если ошибок нет - добавляем статью
    new_id = max([article['id'] for article in articles_list], default=0) + 1
    new_article = {
        'id': new_id,
        'author': author,
        'title': title,
        'description': description,
        'date': date,
        'phone': phone
    }
    
    articles_list.append(new_article)
    articles_list.sort(key=lambda x: x['date'], reverse=True)
    save_articles(articles_list)
    
    # Возвращаем страницу с очищенной формой и обновлённым списком
    return dict(
        title='Полезные статьи',
        message='Страница полезных статей',
        year=datetime.now().year,
        articles=articles_list,
        errors={},
        form_data={}  # Пустые данные формы = очищенная форма
    )