"""
Routes and views for the bottle application.
"""
from bottle import route, view, request
from datetime import datetime
import json
import os
from bottle import static_file

# Импортируем валидаторы
from validator import validate_article_form, validate_phone, validate_review_form

# Путь к файлу с данными 
ARTICLES_FILE = 'articles.json'
REVIEWS_FILE = 'reviews.json'
# Загрузка статьей
def load_articles():
    if os.path.exists(ARTICLES_FILE):
        try:
            with open(ARTICLES_FILE, 'r', encoding='utf-8') as f:
                return json.load(f)
        except:
            return []
    return []

# Сохранение статьей
def save_articles(articles_list):
    with open(ARTICLES_FILE, 'w', encoding='utf-8') as f:
        json.dump(articles_list, f, ensure_ascii=False, indent=4)

#Загрузка отзывов
def load_reviews():
    if os.path.exists(REVIEWS_FILE):
        try:
            with open(REVIEWS_FILE, 'r', encoding='utf-8') as f:
                return json.load(f)
        except:
            return []
    return []

# Сохранение отзывов
def save_reviews(reviews_list):
    with open(REVIEWS_FILE, 'w', encoding='utf-8') as f:
        json.dump(reviews_list, f, ensure_ascii=False, indent=4)

# Сохранение книг
def get_books_list(reviews_list):
    # Собираем уникальные названия книг для фильтра
    titles = {r['book_title'] for r in reviews_list if r.get('book_title')}
    return sorted(list(titles))


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
# ==================== ОТЗЫВЫ  ====================
@route('/reviews')
@view('reviews')
def reviews_get():
    reviews_list = load_reviews()
    reviews_list.sort(key=lambda x: x.get('date', ''), reverse=True)
    
    return dict(
        title='Отзывы о книгах',
        year=datetime.now().year,
        reviews=reviews_list,
        books_list=get_books_list(reviews_list),
        errors={},
        form_data={},
        success_message=None
    )

@route('/reviews', method='POST')
@view('reviews')
def reviews_post():
    reviews_list = load_reviews()
    
    # Собираем данные из формы
    form_data = {
        'book_title': request.forms.getunicode('book_title', '').strip(),
        'author':     request.forms.getunicode('author', '').strip(),
        'review_text':request.forms.getunicode('review_text', '').strip(),
        'rating':     request.forms.getunicode('rating', '').strip(),
        'phone':      request.forms.getunicode('phone', '').strip(),
        'date':       datetime.now().strftime('%Y-%m-%d')  # Дата ставится автоматически
    }
    
    errors = validate_review_form(form_data)
    
    # Вспомогательная функция для рендера (чтобы не дублировать код)
    def render(**kwargs):
        return dict(
            title='Отзывы о книгах',
            year=datetime.now().year,
            reviews=reviews_list,
            books_list=get_books_list(reviews_list),
            errors=kwargs.get('errors', {}),
            form_data=kwargs.get('form_data', {}),
            success_message=kwargs.get('success_message')
        )
    
    # Если есть ошибки → возвращаем форму с подсветкой
    if errors:
        return render(errors=errors, form_data=form_data)
    
    # Формируем новый отзыв
    new_id = max((r.get('id', 0) for r in reviews_list), default=0) + 1
    new_review = {
        'id': new_id,
        'book_title': form_data['book_title'],
        'author':     form_data['author'],
        'review_text':form_data['review_text'],
        'rating':     int(form_data['rating']),
        'phone':      form_data['phone'],
        'date':       form_data['date']
    }
    
    reviews_list.append(new_review)
    save_reviews(reviews_list)
    reviews_list.sort(key=lambda x: x.get('date', ''), reverse=True)
    
    # Возвращаем страницу с очищенной формой и сообщением об успехе
    return render(success_message='Отзыв успешно опубликован!')