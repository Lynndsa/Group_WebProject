"""
Routes and views for the bottle application.
"""
from bottle import route, view, request
from datetime import datetime
import json
import os
from bottle import static_file

# Импортируем валидаторы
from validator import validate_article_form, validate_phone

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

@route('/static/<filename:path>')
def send_static(filename):
    return static_file(filename, root='./static')


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

@route('/reviews')
@view('reviews')
def reviews_mock():
    mock_reviews = [
        {
            'book_title': 'Оно',
            'author': 'Иван Петров',
            'review_text': 'Очень страшная и атмосферная книга. Не мог оторваться!',
            'date': '2024-05-01',
            'phone': '+7 (999) 123-45-67',
            'rating': '8'
        },
        {
            'book_title': 'Зеленая миля',
            'author': 'Анна С.',
            'review_text': 'Грустная, но невероятно добрая история.',
            'date': '2024-04-28',
            'phone': '',
            'rating': '9'
        }
    ]
    
    # Собираем уникальные названия книг из отзывов для выпадающего списка
    books_list = sorted(list(set([r['book_title'] for r in mock_reviews])))

    return dict(
        title='Отзывы о книгах',
        year=datetime.now().year,
        reviews=mock_reviews,
        books_list=books_list,  # ️ ОБЯЗАТЕЛЬНО ПЕРЕДАЁМ СПИСОК КНИГ
        errors={},
        form_data={},
        success_message=None  
    )

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
