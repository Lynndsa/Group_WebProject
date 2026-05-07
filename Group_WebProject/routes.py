
import re 
from bottle import route, view, request, static_file, template, redirect, post, run
from datetime import datetime
from validator import validate_article_form, validate_review_form
import json
import os
import uuid

# Путь к файлу с данными 
ARTICLES_FILE = 'articles.json'
REVIEWS_FILE = 'reviews.json'
BOOKS_FILE = 'books.json'  # Файл для хранения данных
STATIC_DIR = './static'

#работа с файлами
def load_articles():
    if os.path.exists(ARTICLES_FILE):
        try:
            with open(ARTICLES_FILE, 'r', encoding='utf-8') as f:
                return json.load(f)
        except:
            return []
    return []

def save_articles(articles_list):
    with open(ARTICLES_FILE, 'w', encoding='utf-8') as f:
        json.dump(articles_list, f, ensure_ascii=False, indent=4)

def load_reviews():
    if os.path.exists(REVIEWS_FILE):
        try:
            with open(REVIEWS_FILE, 'r', encoding='utf-8') as f:
                return json.load(f)
        except:
            return []
    return []

def save_reviews(reviews_list):
    with open(REVIEWS_FILE, 'w', encoding='utf-8') as f:
        json.dump(reviews_list, f, ensure_ascii=False, indent=4)

#обработка телефона
def normalize_phone(phone: str) -> str:
    digits = re.sub(r'\D', '', phone) 
    if len(digits) == 11:
        if digits.startswith('8'):
            digits = '7' + digits[1:]
    elif len(digits) == 10:
        digits = '7' + digits
    return f'+{digits}' if len(digits) == 11 else phone
# поиск пользователя по номеру телефона
def find_user_by_phone(users_list, phone):
    target = normalize_phone(phone)
    for i, user in enumerate(users_list):
        if normalize_phone(user.get('phone', '')) == target:
            return i
    return -1

#список список названия книг
def get_books_list(users_list):
    titles = set()
    for user in users_list:
        for review in user.get('reviews', []):
            if review.get('book_title'):
                titles.add(review['book_title'])
    return sorted(list(titles))
#подгрузка скриптов
@route('/static/<filename:path>')
def send_static(filename):
    return static_file(filename, root='./static')


# маршруты
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


# СТАТЬИ 
@route('/articles')
@view('articles')
def articles_page():
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
    articles_list = load_articles()
    
    form_data = {
        'author': request.forms.getunicode('author', '').strip(),
        'title': request.forms.getunicode('title', '').strip(),
        'description': request.forms.getunicode('description', '').strip(),
        'date': request.forms.getunicode('date', '').strip(),
        'phone': request.forms.getunicode('phone', '').strip()
    }
    
    errors = validate_article_form(form_data)
    
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
    
    return dict(
        title='Полезные статьи',
        message='Страница полезных статей',
        year=datetime.now().year,
        articles=articles_list,
        errors={},
        form_data={}
    )


# ОТЗЫВЫ
@route('/reviews')
@view('reviews')
def reviews_get():
    # Загружаем и сортируем пользователей по дате последнего отзыва
    users_list = load_reviews()
    users_list.sort(key=lambda u: max((r.get('date', '') for r in u.get('reviews', [])), default=''), reverse=True)
    
    return dict(
        title='Отзывы о книгах',
        year=datetime.now().year,
        users=users_list,
        books_list=get_books_list(users_list),  # Уникальные названия для фильтра
        errors={},
        form_data={},
        success_message=None
    )

@route('/reviews', method='POST')
@view('reviews')
def reviews_post():
    users_list = load_reviews()
    
    # собираем данные формы
    form_data = {
        'book_title': request.forms.getunicode('book_title', '').strip(),
        'author':     request.forms.getunicode('author', '').strip(),
        'review_text':request.forms.getunicode('review_text', '').strip(),
        'rating':     request.forms.getunicode('rating', '').strip(),
        'phone':      request.forms.getunicode('phone', '').strip(),
        'date':       datetime.now().strftime('%Y-%m-%d')  # Авто-дата
    }
    
    #валидация полей
    errors = validate_review_form(form_data)
    
    #проверка уникальности телефона 
    if not errors:
        form_data['phone'] = normalize_phone(form_data['phone'])  # +7...
        user_idx = find_user_by_phone(users_list, form_data['phone'])
        
        #если телефон уже есть, но имя не совпадает — ошибка
        if user_idx != -1:
            existing_author = users_list[user_idx].get('author')
            if existing_author != form_data['author']:
                errors['phone'] = f'Номер {form_data["phone"]} уже зарегистрирован на пользователя "{existing_author}"'
    
    #функция-сборщик данных 
    def render(**kwargs):
        return dict(
            title='Отзывы о книгах',
            year=datetime.now().year,
            users=users_list,
            books_list=get_books_list(users_list),
            errors=kwargs.get('errors', {}),
            form_data=kwargs.get('form_data', {}),
            success_message=kwargs.get('success_message')
        )
    
    #если есть ошибки — возвращаем форму с подсветкой
    if errors:
        return render(errors=errors, form_data=form_data)
    
    #генерация ID для нового отзыва
    max_id = 0
    for u in users_list:
        for r in u.get('reviews', []):
            if r.get('id', 0) > max_id: max_id = r.get('id', 0)
    new_id = max_id + 1
    
    #формируем объект отзыва
    new_review = {
        'id': new_id,
        'book_title': form_data['book_title'],
        'author':     form_data['author'],
        'review_text':form_data['review_text'],
        'rating':     int(form_data['rating']),  # Преобразуем строку в число
        'phone':      form_data['phone'],  
        'date':       form_data['date']
    }
    
    #добавляем отзыв существующему пользователю или создаём нового
    user_idx = find_user_by_phone(users_list, form_data['phone'])
    if user_idx != -1:
        users_list[user_idx]['reviews'].append(new_review)
        users_list[user_idx]['reviews'].sort(key=lambda x: x.get('date', ''), reverse=True)
    else:
        users_list.append({
            'phone': form_data['phone'],
            'author': form_data['author'],
            'reviews': [new_review]
        })
    
    save_reviews(users_list)
    # Пересортировка пользователей для корректного отображения
    users_list.sort(key=lambda u: max((r.get('date', '') for r in u.get('reviews', [])), default=''), reverse=True)
    
    return render(success_message='Отзыв успешно опубликован!')

# НОВИНКИ

# ===== ФУНКЦИИ ДЛЯ РАБОТЫ С JSON =====
def load_books():
    """Загрузить книги из JSON файла"""
    if not os.path.exists(BOOKS_FILE):
        return []  # Если файла нет — возвращаем пустой список
    
    try:
        with open(BOOKS_FILE, 'r', encoding='utf-8') as f:
            return json.load(f)
    except (json.JSONDecodeError, IOError):
        return []  # Если ошибка — возвращаем пустой список

def save_books(books):
    """Сохранить книги в JSON файл"""
    
    with open(BOOKS_FILE, 'w', encoding='utf-8') as f:
        json.dump(books, f, ensure_ascii=False, indent=2)

# ===== МАРШРУТЫ =====
@route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root=STATIC_DIR)

@route('/')
def index():
    return template('index', title='Главная', year=2026, encoding='utf-8')

@route('/add_book_page')
def show_add_form():
    books = load_books()  # ← Загружаем из файла при каждом открытии
    return template('add_book', title='Добавить книгу',  books=books, year=2026, encoding='utf-8')

@post('/add_book')
def save_new_book():
    # Получаем данные из формы
    title = request.forms.get('title')
    release_date = request.forms.get('release_date')
    description = request.forms.get('description')
    rating = request.forms.get('rating')
    
    # Обработка фото
    upload = request.files.get('cover')
    cover_url = "/static/images/default_book.jpg"
    
    if upload:
        ext = upload.filename.split('.')[-1]
        # ✅ Генерируем уникальное имя
        unique_id = uuid.uuid4().hex[:8]  # Первые 8 символов UUID
        new_filename = f"book_{unique_id}.{ext}"
    
        save_path = os.path.join(STATIC_DIR, 'images', 'books', new_filename)
        os.makedirs(os.path.dirname(save_path), exist_ok=True)
    
        upload.save(save_path)  # ← Теперь ошибки не будет
        cover_url = f"/static/images/books/{new_filename}"
    
    # Загружаем текущие книги, добавляем новую, сохраняем
    books = load_books()
    books.append({
        'title': title,
        'release_date': release_date,
        'description': description,
        'rating': rating,
        'cover': cover_url
    })
    save_books(books)  # ← Сохраняем в JSON файл!
    
    redirect('/add_book_page')

