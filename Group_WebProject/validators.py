
import re
from datetime import datetime


def validate_author(author: str) -> tuple[bool, str | None]:
    """
    Валидация имени автора.
    Возвращает (успех, сообщение_об_ошибке).
    """
    if not author:
        return False, 'Поле Автор обязательно для заполнения'
    if len(author.strip()) < 2:
        return False, 'Имя автора должно содержать минимум 2 символа'
    return True, None


def validate_title(title: str, field_name: str = 'Наименование статьи', min_length: int = 5) -> tuple[bool, str | None]:
    """
    Валидация заголовка/названия.
    field_name — название поля для сообщения об ошибке.
    min_length — минимальная длина (по умолчанию 5).
    """
    if not title:
        return False, f'Поле {field_name} обязательно для заполнения'
    if len(title.strip()) < min_length:
        return False, f'{field_name} должно содержать минимум {min_length} символов'
    return True, None


def validate_description(description: str, min_length: int = 20) -> tuple[bool, str | None]:
    """
    Валидация текстового описания.
    """
    if not description:
        return False, 'Поле Описание обязательно для заполнения'
    if len(description.strip()) < min_length:
        return False, f'Описание должно содержать минимум {min_length} символов'
    return True, None


def validate_date(date_str: str) -> tuple[bool, str | None]:
    """
    Валидация даты в формате YYYY-MM-DD.
    """
    if not date_str:
        return False, 'Поле Дата обязательно для заполнения'
    try:
        datetime.strptime(date_str, '%Y-%m-%d')
        return True, None
    except ValueError:
        return False, 'Дата должна быть в формате ГГГГ-ММ-ДД'


def validate_phone(phone: str, required: bool = True) -> tuple[bool, str | None]:
    """
    Валидация телефона в формате +7 (XXX) XXX-XX-XX или 8 (XXX) XXX-XX-XX.
    required=False — поле необязательное.
    """
    if not phone:
        if required:
            return False, 'Поле Телефон обязательно для заполнения'
        return True, None
    
    # Убираем лишние символы для проверки
    cleaned = re.sub(r'[\s\(\)\-]', '', phone)
    pattern = r'^(\+7|8)\d{10}$'
    
    if re.match(pattern, cleaned):
        return True, None
    return False, 'Телефон должен быть в формате +7 (XXX) XXX-XX-XX'


def validate_article_form(form_data: dict) -> dict[str, str]:
    """
    Комплексная валидация формы статьи.
    Возвращает словарь ошибок: { поле: сообщение }.
    """
    errors = {}
    
    author = form_data.get('author', '').strip()
    title = form_data.get('title', '').strip()
    description = form_data.get('description', '').strip()
    date = form_data.get('date', '').strip()
    phone = form_data.get('phone', '').strip()
    
    # Автор
    ok, err = validate_author(author)
    if not ok:
        errors['author'] = err
    
    # Заголовок
    ok, err = validate_title(title)
    if not ok:
        errors['title'] = err
    
    # Описание
    ok, err = validate_description(description)
    if not ok:
        errors['description'] = err
    
    # Дата
    ok, err = validate_date(date)
    if not ok:
        errors['date'] = err
    
    # Телефон
    ok, err = validate_phone(phone, required=True)
    if not ok:
        errors['phone'] = err
    
    return errors