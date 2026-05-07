# -*- coding: cp1251 -*-
import unittest
import sys
from pathlib import Path

# Добавляем корень проекта в sys.path, чтобы работал импорт из validators.py
sys.path.insert(0, str(Path(__file__).parent.parent))

# Импортируем только те функции, которые реально используем в тестах
from validator import (
    validate_author, 
    validate_rating, 
    validate_description, 
    validate_phone, 
    validate_review_form
)


class TestAuthorField(unittest.TestCase):
    """Тесты поля «Автор»: кириллица, ≥2 символа, не пусто"""
    
    def test_valid_author(self):
        # Корректное имя на кириллице должно проходить
        is_valid, error = validate_author("Иванов Иван")
        self.assertTrue(is_valid)

    def test_author_latin_rejected(self):
        # Латиница в имени — ошибка (требование: только русские буквы)
        is_valid, error = validate_author("John Doe")
        self.assertFalse(is_valid)
        self.assertIn("русские буквы", error)

    def test_author_too_short(self):
        # Имя из 1 символа — слишком короткое
        is_valid, error = validate_author("А")
        self.assertFalse(is_valid)
        self.assertIn("минимум 2 символа", error)

    def test_author_empty(self):
        # Пустое поле — обязательное для заполнения
        is_valid, error = validate_author("")
        self.assertFalse(is_valid)
        self.assertIn("обязательно", error)


class TestBookTitleField(unittest.TestCase):
    """Тесты поля «Название книги»: кириллица/цифры, ≥3 символа"""
    
    def _check_title(self, title):
        # Вспомогательный метод: валидация book_title зашита внутри validate_review_form
        data = {'author': 'Тест', 'book_title': title, 'rating': '5', 
                'review_text': 'Достаточно букв для проверки.', 'phone': '+79001234567'}
        return validate_review_form(data)

    def test_valid_title(self):
        # Корректное название на кириллице
        errors = self._check_title("Преступление и наказание")
        self.assertNotIn('book_title', errors)

    def test_title_latin_rejected(self):
        # Латиница в названии книги — ошибка
        errors = self._check_title("Harry Potter")
        self.assertIn('book_title', errors)
        self.assertIn("кириллицу", errors['book_title'])

    def test_title_too_short(self):
        # Название из 2 символов — меньше требуемых 3
        errors = self._check_title("То")
        self.assertIn('book_title', errors)
        self.assertIn("длиннее 3 символов", errors['book_title'])

    def test_title_empty(self):
        # Пустое название — ошибка
        errors = self._check_title("")
        self.assertIn('book_title', errors)


class TestReviewTextField(unittest.TestCase):
    """Тесты поля «Текст отзыва»: ≥10 русских букв, запрет латиницы"""
    
    def test_valid_text(self):
        # Текст с достаточным количеством кириллических букв
        is_valid, error = validate_description("Глубокий философский роман, который заставляет задуматься.", min_letters=10)
        self.assertTrue(is_valid)

    def test_text_too_few_letters(self):
        # Мало русских букв (пробелы и короткие слова не считаются)
        is_valid, error = validate_description("Норм ок", min_letters=10)
        self.assertFalse(is_valid)
        self.assertIn("минимум", error)

    def test_text_latin_rejected(self):
        # Полностью латинский текст — ошибка (нет русских букв)
        is_valid, error = validate_description("Very good book really liked it")
        self.assertFalse(is_valid)
        self.assertIn("русских букв", error)  

    def test_text_empty(self):
        # Пустой текст — обязательное поле
        is_valid, error = validate_description("")
        self.assertFalse(is_valid)
        self.assertIn("обязательно", error)


class TestRatingField(unittest.TestCase):
    """Тесты поля «Оценка»: целое число 0..10"""
    
    def test_valid_rating(self):
        # Корректная оценка в диапазоне
        is_valid, error = validate_rating("8")
        self.assertTrue(is_valid)

    def test_rating_out_of_range(self):
        # Значения вне 0..10 отклоняются
        is_valid, error = validate_rating("11")
        self.assertFalse(is_valid)
        self.assertIn("от 0 до 10", error)
        
        is_valid, error = validate_rating("-1")
        self.assertFalse(is_valid)

    def test_rating_not_number(self):
        # Текст вместо числа — ошибка преобразования
        is_valid, error = validate_rating("пять")
        self.assertFalse(is_valid)
        self.assertIn("целым числом", error)

    def test_rating_empty(self):
        # Пустое поле — обязательное
        is_valid, error = validate_rating("")
        self.assertFalse(is_valid)
        self.assertIn("обязательна", error)


class TestPhoneField(unittest.TestCase):
    """Тесты поля «Телефон»: +7/8 + 11 цифр, игнорирование форматирования"""
    
    def test_valid_phone_clean(self):
        # Валидные номера в «чистом» формате
        is_valid, error = validate_phone("+79001234567")
        self.assertTrue(is_valid)
        
        is_valid, error = validate_phone("89001234567")
        self.assertTrue(is_valid)

    def test_valid_phone_formatted(self):
        # Форматирование (пробелы, скобки, дефисы) должно игнорироваться
        is_valid, error = validate_phone("+7 (900) 123-45-67")
        self.assertTrue(is_valid)

    def test_invalid_phone_length(self):
        # Номер не из 11 цифр — ошибка
        is_valid, error = validate_phone("+7900123")
        self.assertFalse(is_valid)
        self.assertIn("11 цифр", error)

    def test_invalid_phone_chars(self):
        # Буквы в номере — недопустимы
        is_valid, error = validate_phone("+7900ABCD567")
        self.assertFalse(is_valid)

    def test_phone_empty(self):
        # Пустой телефон (при required=True) — ошибка
        is_valid, error = validate_phone("", required=True)
        self.assertFalse(is_valid)
        self.assertIn("обязательно", error)


class TestReviewFormIntegration(unittest.TestCase):
    """Интеграционные тесты: проверка всей формы отзыва целиком"""
    
    def test_all_fields_valid(self):
        # Все поля заполнены корректно → ошибок быть не должно
        data = {
            'author': 'Петров Иван',
            'book_title': 'Война и мир',
            'rating': '9',
            'review_text': 'Классическое произведение, которое обязательно к прочтению каждому.',
            'phone': '+7 (999) 111-22-33'
        }
        errors = validate_review_form(data)
        self.assertEqual(len(errors), 0, f"Ожидалось 0 ошибок, но получили: {errors}")

    def test_multiple_errors_collected(self):
        # Все поля с ошибками → должны собраться ВСЕ ошибки (не первая попавшаяся)
        data = {
            'author': 'J.Doe',      # латиница
            'book_title': 'x',       # < 3 символов
            'rating': 'abc',         # не число
            'review_text': 'test',   # латиница, < 10 букв
            'phone': ''              # пусто
        }
        errors = validate_review_form(data)
        self.assertEqual(len(errors), 5)  # Ожидаем ровно 5 ошибок
        self.assertIn('author', errors)
        self.assertIn('book_title', errors)
        self.assertIn('rating', errors)
        self.assertIn('review_text', errors)
        self.assertIn('phone', errors)


if __name__ == '__main__':
    # Запуск с подробным выводом: видно имя каждого теста и результат
    unittest.main(verbosity=2)