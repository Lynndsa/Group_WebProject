# -*- coding: utf-8 -*-
import re
from datetime import datetime

#Проверка имени
def validate_author(author):
    # Валидация имени автора
    if not author:
        return False, 'Поле Автор обязательно для заполнения'
    if len(author.strip()) < 3 or len(author.strip()) > 30:
        return False, 'Имя автора должно не может быть меньше 3 символов или больше 30 симоволов '
    # Только буквы,цифры и пробелы
    if not re.match(r'^[а-яА-ЯёЁ0-9\s]+$', author.strip()):
        return False, 'Имя может содержать только русские буквы,цифры и пробелы'
    return True, None

#Проверка названия
def validate_title(title,field_name = "Название"):
    if not title:
        return False, f'Поле {field_name} обязательно для заполнения'
    if len(title.strip()) < 5:
        return False, f'{field_name} должно содержать минимум {5} символов'
    return True, None

#Проверка Описания
def validate_description(description ) :
    # Валидация текстового описания
    if not description:
        return False, 'Поле Описание обязательно для заполнения'
    # Считаем только буквы (кириллица)
    letters = re.findall(r'[а-яА-ЯёЁ]', description)
    if len(letters) < 10:
        return False, f'Текст должен содержать минимум {10} русских букв'
    # Разрешаем буквы, цифры, пробелы, пунктуацию и кавычки (включая «» для цитат)
    allowed_pattern = r'^[а-яА-ЯёЁ0-9\s.,!?;:\-\'"()«»]+$'
    if not re.match(allowed_pattern, description.strip()):
        return False, 'Текст может содержать только русские буквы, цифры, знаки препинания и кавычки'
        
    return True, None


#Проверка даты
def validate_date(date_str):
    s = date_str.strip()
    if not s:
        return False, 'Поле Дата обязательно для заполнения'
    
    try:
        # Превращаем строку в объект даты (отсекаем время)
        input_date = datetime.strptime(s, '%Y-%m-%d').date()
    except ValueError:
        return False, 'Дата должна быть в формате ГГГГ-ММ-ДД'
    
    # Получаем текущую дату (без времени)
    today = datetime.now().date()
    
    # Проверяем, не является ли дата будущей (год, месяц и день)
    if input_date > today:
        return False, 'Дата не может быть в будущем'
        
    return True, None

#Проверка номера телефона
def validate_phone(phone) :
     # Валидация номера
    if not phone:
        return False, 'Поле Телефон обязательно для заполнения'
    #Паттерн на проверку номера
    cleaned = re.sub(r'[\s\(\)\-]', '', phone)
    pattern = r'^(\+7|8)\d{10}$'
    
    if re.match(pattern, cleaned):
        return True, None
    return False, 'Телефон должен начинаться с +7 или 8 и содержать 11 цифр'

#Проверка рейтинга
def validate_rating(rating) :
    if not rating:
        return False, 'Оценка обязательна для заполнения'
    try:
        val = int(rating)
        if val < 0 or val > 10:
            return False, 'Оценка должна быть от 0 до 10'
        return True, None
    except ValueError:
        return False, 'Оценка должна быть целым числом'

#Валидация формы со статьями
def validate_article_form(form_data):
    errors = {}
    
    author = form_data.get('author', '').strip()
    title = form_data.get('title', '').strip()
    description = form_data.get('description', '').strip()
    date = form_data.get('date', '').strip()
    phone = form_data.get('phone', '').strip()
    
    ok, err = validate_author(author)
    if not ok: errors['author'] = err
    
    ok, err = validate_title(title)
    if not ok: errors['title'] = err
    
    # Для статей, возможно, стоит оставить проверку по символам, но можно и по буквам
    ok, err = validate_description(description)
    if not ok: errors['description'] = err
    
    ok, err = validate_date(date)
    if not ok: errors['date'] = err
    
    ok, err = validate_phone(phone)
    if not ok: errors['phone'] = err
    
    return errors

#Валидация формы с отзывами
def validate_review_form(form_data):
    errors = {}
    
    author = form_data.get('author', '').strip()
    book_title = form_data.get('book_title', '').strip()
    review_text = form_data.get('review_text', '').strip()
    rating = form_data.get('rating', '').strip()
    phone = form_data.get('phone', '').strip()
    
    # 1. Автор
    ok, err = validate_author(author)
    if not ok: errors['author'] = err
    
    # 2. Название книги
    if not book_title:
        errors['book_title'] = 'Название книги обязательно'
    elif book_title.isdigit():
        errors['book_title'] = 'Название не может состоять только из цифр'
    elif len(book_title) < 3:
        errors['book_title'] = 'Название должно быть длиннее 3 символов'
    elif not re.match(r'^[а-яА-ЯёЁ0-9\s/]+$', book_title):
        errors['book_title'] = 'Название может содержать только кириллицу и цифры '
        
    # 3. Оценка
    ok, err = validate_rating(rating)
    if not ok: errors['rating'] = err
    
    # 4. Текст отзыва 
    ok, err = validate_description(review_text)
    if not ok: errors['review_text'] = err
    
    # 5. Телефон
    ok, err = validate_phone(phone)
    if not ok: errors['phone'] = err
    
    return errors

def validate_age_rating(rating):
    """Проверка возрастного ограничения книги"""
    if not rating:
        return False, 'Возрастной рейтинг обязателен для заполнения'
    
    allowed_ratings = ['0+', '6+', '12+', '16+', '18+']
    
    if rating not in allowed_ratings:
        return False, f'Рейтинг должен быть одним из: {", ".join(allowed_ratings)}'
    
    return True, None

# Проверка файла обложки
def validate_cover(upload, required=True):
    """Проверка загружаемого файла обложки"""
    
    # ПРОВЕРКА 1: Если upload вообще нет
    if not upload:
        if required:
            return False, 'Обложка книги обязательна'
        else:
            return True, None
    
    # ПРОВЕРКА 2: Если filename пустой (файл не выбран!)
    if not upload.filename or upload.filename.strip() == '':
        if required:
            return False, 'Обложка книги обязательна'
        else:
            return True, None
    
    # Проверка расширения
    allowed_extensions = ['jpg', 'jpeg', 'png', 'gif', 'webp']
    ext = upload.filename.split('.')[-1].lower()
    
    if ext not in allowed_extensions:
        return False, f'Разрешены только изображения: {", ".join(allowed_extensions)}'
    
    # Проверка размера (максимум 5 МБ)
    MAX_SIZE = 5 * 1024 * 1024  # 5 MB
    
    try:
        content = upload.file.read()
        file_size = len(content)
        
        if file_size > MAX_SIZE:
            return False, 'Размер файла не должен превышать 5 МБ'
        
        if file_size == 0:
            return False, 'Файл пустой'
        
        # Возвращаем файл обратно в начало
        upload.file.seek(0)
    except Exception as e:
        return False, f'Ошибка чтения файла: {str(e)}'
    
    return True, None

# Проверка названия книги (Стивен Кинг)
def validate_book_title(title):

    if not title:
        return False, 'Название книги обязательно для заполнения'

    title = title.strip()

    if len(title) < 2:
        return False, 'Название должно содержать минимум 2 символа'

    if len(title) > 150:
        return False, 'Название не должно превышать 150 символов'

    # Нельзя только цифры
    if title.isdigit():
        return False, 'Название не может состоять только из цифр'

    # Должна быть хотя бы одна буква
    if not re.search(r'[а-яА-ЯёЁa-zA-Z]', title):
        return False, 'Название должно содержать хотя бы одну букву'

    # Разрешённые символы
    if not re.match(r'^[а-яА-ЯёЁa-zA-Z0-9\s\-\.\,\:\!\?]+$', title):
        return False, 'Название содержит недопустимые символы'

    return True, None

# Проверка даты выхода книги
def validate_book_date(date_str):
    """Проверка даты выхода книги (может быть в прошлом или будущем)"""
    s = date_str.strip()
    if not s:
        return False, 'Дата выхода обязательна для заполнения'
    
    try:
        input_date = datetime.strptime(s, '%Y-%m-%d').date()
    except ValueError:
        return False, 'Дата должна быть в формате ГГГГ-ММ-ДД'
    
    # Для книг можно указывать будущие даты (анонсы)
    # Но не раньше 1900 года
    if input_date.year < 1900:
        return False, 'Год не может быть раньше 1900'
    
    # Не слишком далеко в будущем (максимум +5 лет)
    max_future = datetime.now().date()
    max_future = max_future.replace(year=max_future.year + 5)
    
    if input_date > max_future:
        return False, 'Дата выхода не может быть более чем на 5 лет в будущем'
    
    return True, None

# Проверка описания книги
def validate_book_description(description):
    if not description:
        return False, 'Описание обязательно для заполнения'
    
    description = description.strip()
    
    if len(description) < 20:
        return False, 'Описание должно содержать минимум 20 символов'
    
    if len(description) > 1000:
        return False, 'Описание не должно превышать 1000 символов'
    
    # Считаем буквы
    letters = re.findall(r'[а-яА-ЯёЁa-zA-Z]', description)
    if len(letters) < 10:
        return False, 'Описание должно содержать минимум 10 букв'
    
    # не больше 50% цифр
    digits = re.findall(r'[0-9]', description)
    if len(digits) > len(description) * 0.5:
        return False, 'Описание не может состоять преимущественно из цифр'
    
    # не только цифры и пробелы
    if re.match(r'^[0-9\s]+$', description):
        return False, 'Описание должно содержать хотя бы несколько букв'
    
    return True, None

def validate_book_form(form_data, file_data=None):
    """
    Полная валидация формы добавления книги
    
    form_data: request.forms (Bottle)
    file_data: request.files (Bottle)
    """
    errors = {}
    
    # Получаем данные
    title = form_data.get('title', '').strip()
    release_date = form_data.get('release_date', '').strip()
    description = form_data.get('description', '').strip()
    rating = form_data.get('rating', '').strip()
    
    # Получаем файл (если есть)
    cover = None
    if file_data:
        cover = file_data.get('cover')
    
    # 1. Название книги
    ok, err = validate_book_title(title)
    if not ok:
        errors['title'] = err
    
    # 2. Дата выхода
    ok, err = validate_book_date(release_date)
    if not ok:
        errors['release_date'] = err
    
    # 3. Описание
    ok, err = validate_book_description(description)
    if not ok:
        errors['description'] = err
    
    # 4. Возрастной рейтинг
    ok, err = validate_age_rating(rating)
    if not ok:
        errors['rating'] = err
    
    # 5. Обложка
    ok, err = validate_cover(cover, required=True)
    if not ok:
        errors['cover'] = err
    
    return errors
