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