"""
Routes and views for the bottle application.
"""
from bottle import route, view, request
from datetime import datetime
import json
import os

# Импортируем валидаторы
from validators import validate_article_form, validate_phone

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


@route('/')
@route('/home')
@view('index')
def home():
    return dict(title='Home page', year=datetime.now().year)

@route('/contact')
@view('contact')
def contact():
    return dict(title='Bio', message='Your contact page.', year=datetime.now().year)

@route('/books')
@view('books')
def about():
    return dict(title='Books', message='Your application description page.', year=datetime.now().year)

@route('/creators')
@view('creators')
def creators():
    return dict(title='Contact', message='Your application description page.', year=datetime.now().year)


# ==================== СТАТЬИ ====================

@route('/articles')
@view('articles')
def articles_page():
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
    
    # Собираем данные формы
    form_data = {
        'author': request.forms.getunicode('author', '').strip(),
        'title': request.forms.getunicode('title', '').strip(),
        'description': request.forms.getunicode('description', '').strip(),
        'date': request.forms.getunicode('date', '').strip(),
        'phone': request.forms.getunicode('phone', '').strip()
    }
    
    # Вызываем валидацию из отдельного модуля
    errors = validate_article_form(form_data)
    
    # Если есть ошибки — показываем форму с данными и ошибками
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
    
    # Всё ок — добавляем статью
    new_id = max([article['id'] for article in articles_list], default=0) + 1
    new_article = {
        'id': new_id,
        'author': form_data['author'],
        'title': form_data['title'],
        'description': form_data['description'],
        'date': form_data['date'],
        'phone': form_data['phone']
    }
    
    articles_list.append(new_article)
    articles_list.sort(key=lambda x: x['date'], reverse=True)
    save_articles(articles_list)
    
    # Возвращаем страницу с очищенной формой
    return dict(
        title='Полезные статьи',
        message='Страница полезных статей',
        year=datetime.now().year,
        articles=articles_list,
        errors={},
        form_data={}
    )