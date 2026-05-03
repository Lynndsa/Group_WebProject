# -*- coding: utf-8 -*-
import re
from datetime import datetime


def validate_author(author: str) -> tuple[bool, str | None]:
    # Валидация имени автора
    if not author:
        return False, 'Поле Автор обязательно для заполнения'
    if len(author.strip()) < 2:
        return False, 'Имя автора должно содержать минимум 2 символа'
    return True, None


def validate_title(title: str, field_name: str = 'Наименование статьи', min_length: int = 5) -> tuple[bool, str | None]:
    # Валидация заголовка/названия (для статей)
    if not title:
        return False, f'Поле {field_name} обязательно для заполнения'
    if len(title.strip()) < min_length:
        return False, f'{field_name} должно содержать минимум {min_length} символов'
    return True, None


def validate_description(description: str, min_length: int = 20) -> tuple[bool, str | None]:
    # Валидация текстового описания
    if not description:
        return False, 'Поле Описание обязательно для заполнения'
    if len(description.strip()) < min_length:
        return False, f'Описание должно содержать минимум {min_length} символов'
    return True, None


def validate_date(date_str: str) -> tuple[bool, str | None]:
    # Валидация даты в формате YYYY-MM-DD
    if not date_str:
        return False, 'Поле Дата обязательно для заполнения'
    try:
        datetime.strptime(date_str, '%Y-%m-%d')
        return True, None
    except ValueError:
        return False, 'Дата должна быть в формате ГГГГ-ММ-ДД'


def validate_phone(phone: str, required: bool = True) -> tuple[bool, str | None]:
    # Валидация номера телефона
    if not phone:
        if required:
            return False, 'Поле Телефон обязательно для заполнения'
        return True, None
    
    cleaned = re.sub(r'[\s\(\)\-]', '', phone)
    pattern = r'^(\+7|8)\d{10}$'
    
    if re.match(pattern, cleaned):
        return True, None
    return False, 'Телефон должен быть в формате +7 (XXX) XXX-XX-XX'


def validate_rating(rating: str) -> tuple[bool, str | None]:
    # Валидация оценки (0-10)
    if not rating:
        return False, 'Оценка обязательна для заполнения'
    try:
        val = int(rating)
        if val < 0 or val > 10:
            return False, 'Оценка должна быть от 0 до 10'
        return True, None
    except ValueError:
        return False, 'Оценка должна быть целым числом'


def validate_article_form(form_data: dict) -> dict[str, str]:
    # Комплексная валидация формы статьи
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
    
    ok, err = validate_description(description)
    if not ok: errors['description'] = err
    
    ok, err = validate_date(date)
    if not ok: errors['date'] = err
    
    ok, err = validate_phone(phone, required=True)
    if not ok: errors['phone'] = err
    
    return errors


def validate_review_form(form_data: dict) -> dict[str, str]:
    # Комплексная валидация формы ОТЗЫВОВ
    errors = {}
    
    author = form_data.get('author', '').strip()
    book_title = form_data.get('book_title', '').strip()
    review_text = form_data.get('review_text', '').strip()
    rating = form_data.get('rating', '').strip()
    phone = form_data.get('phone', '').strip()
    
    # 1. Автор
    ok, err = validate_author(author)
    if not ok: errors['author'] = err
    
    # 2. Название книги (только кириллица, цифры, пробелы и /)
    if not book_title:
        errors['book_title'] = 'Поле Название книги обязательно для заполнения'
    elif len(book_title) < 3:
        errors['book_title'] = 'Название книги должно содержать минимум 3 символа'
    elif not re.match(r'^[а-яА-ЯёЁ0-9\s/]+$', book_title):
        errors['book_title'] = 'Название книги может содержать только кириллицу, цифры, пробелы и символ /'
        
    # 3. Оценка
    ok, err = validate_rating(rating)
    if not ok: errors['rating'] = err
    
    # 4. Текст отзыва (минимум 10 символов)
    ok, err = validate_description(review_text, min_length=10)
    if not ok: errors['review_text'] = err
    
    # 5. Телефон (обязателен по ТЗ)
    ok, err = validate_phone(phone, required=True)
    if not ok: errors['phone'] = err
    
    return errors