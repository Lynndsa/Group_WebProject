# -*- coding: cp1251 -*-
import unittest
import sys
from pathlib import Path

# Добавляем корень проекта в путь импорта
sys.path.insert(0, str(Path(__file__).parent.parent))

from validator import (
    validate_author, 
    validate_rating, 
    validate_description, 
    validate_phone, 
    validate_review_form
)


class TestAuthorField(unittest.TestCase):
    """Тесты поля: Автор"""
    def test_valid_author(self):
        is_valid, error = validate_author("Иванов Иван")
        self.assertTrue(is_valid)

    def test_author_latin_rejected(self):
        is_valid, error = validate_author("John Doe")
        self.assertFalse(is_valid)
        self.assertIn("русские буквы", error)

    def test_author_too_short(self):
        is_valid, error = validate_author("А")
        self.assertFalse(is_valid)
        self.assertIn("минимум 2 символа", error)

    def test_author_empty(self):
        is_valid, error = validate_author("")
        self.assertFalse(is_valid)
        self.assertIn("обязательно", error)


class TestBookTitleField(unittest.TestCase):
    """Тесты поля: Название книги"""
    def _check_title(self, title):
        # Проверяем через основную функцию, так как валидация зашита внутри неё
        data = {'author': 'Тест', 'book_title': title, 'rating': '5', 
                'review_text': 'Достаточно букв для проверки.', 'phone': '+79001234567'}
        return validate_review_form(data)

    def test_valid_title(self):
        errors = self._check_title("Преступление и наказание")
        self.assertNotIn('book_title', errors)

    def test_title_latin_rejected(self):
        errors = self._check_title("Harry Potter")
        self.assertIn('book_title', errors)
        self.assertIn("кириллицу", errors['book_title'])

    def test_title_too_short(self):
        errors = self._check_title("То")
        self.assertIn('book_title', errors)
        self.assertIn("длиннее 3 символов", errors['book_title'])

    def test_title_empty(self):
        errors = self._check_title("")
        self.assertIn('book_title', errors)


class TestReviewTextField(unittest.TestCase):
    """Тесты поля: Текст отзыва"""
    def test_valid_text(self):
        is_valid, error = validate_description("Глубокий философский роман, который заставляет задуматься.", min_letters=10)
        self.assertTrue(is_valid)

    def test_text_too_few_letters(self):
        is_valid, error = validate_description("Норм ок", min_letters=10)
        self.assertFalse(is_valid)
        self.assertIn("минимум", error)

    def test_text_latin_rejected(self):
        is_valid, error = validate_description("Very good book really liked it")
        self.assertFalse(is_valid)
        self.assertIn("русских букв", error)  

    def test_text_empty(self):
        is_valid, error = validate_description("")
        self.assertFalse(is_valid)
        self.assertIn("обязательно", error)


class TestRatingField(unittest.TestCase):
    """Тесты поля: Оценка"""
    def test_valid_rating(self):
        is_valid, error = validate_rating("8")
        self.assertTrue(is_valid)

    def test_rating_out_of_range(self):
        is_valid, error = validate_rating("11")
        self.assertFalse(is_valid)
        self.assertIn("от 0 до 10", error)
        
        is_valid, error = validate_rating("-1")
        self.assertFalse(is_valid)

    def test_rating_not_number(self):
        is_valid, error = validate_rating("пять")
        self.assertFalse(is_valid)
        self.assertIn("целым числом", error)

    def test_rating_empty(self):
        is_valid, error = validate_rating("")
        self.assertFalse(is_valid)
        self.assertIn("обязательна", error)


class TestPhoneField(unittest.TestCase):
    """Тесты поля: Телефон"""
    def test_valid_phone_clean(self):
        is_valid, error = validate_phone("+79001234567")
        self.assertTrue(is_valid)
        
        is_valid, error = validate_phone("89001234567")
        self.assertTrue(is_valid)

    def test_valid_phone_formatted(self):
        is_valid, error = validate_phone("+7 (900) 123-45-67")
        self.assertTrue(is_valid)

    def test_invalid_phone_length(self):
        is_valid, error = validate_phone("+7900123")
        self.assertFalse(is_valid)
        self.assertIn("11 цифр", error)

    def test_invalid_phone_chars(self):
        is_valid, error = validate_phone("+7900ABCD567")
        self.assertFalse(is_valid)

    def test_phone_empty(self):
        is_valid, error = validate_phone("", required=True)
        self.assertFalse(is_valid)
        self.assertIn("обязательно", error)


class TestReviewFormIntegration(unittest.TestCase):
    """Интеграционный тест: проверка всей формы отзыва целиком"""
    
    def test_all_fields_valid(self):
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
        data = {
            'author': 'J.Doe',
            'book_title': 'x',
            'rating': 'abc',
            'review_text': 'test',
            'phone': ''
        }
        errors = validate_review_form(data)
        self.assertEqual(len(errors), 5)
        self.assertIn('author', errors)
        self.assertIn('book_title', errors)
        self.assertIn('rating', errors)
        self.assertIn('review_text', errors)
        self.assertIn('phone', errors)


if __name__ == '__main__':
    unittest.main(verbosity=2)(verbosity=2)