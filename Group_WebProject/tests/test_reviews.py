# -*- coding: utf-8 -*-
import unittest
import sys
from pathlib import Path

# Добавляем корень проекта в sys.path для импорта validator.py
sys.path.insert(0, str(Path(__file__).parent.parent))

from validator import (
    validate_author, validate_rating, validate_description, 
    validate_phone, validate_review_form
)

class TestAuthorField(unittest.TestCase):
    def test_valid_author(self):
        is_valid, _ = validate_author("Иванов Иван")
        self.assertTrue(is_valid)

    def test_author_invalid_latin(self):
        is_valid, error = validate_author("John Doe")
        self.assertFalse(is_valid)
        self.assertIn("русские", error)

    def test_author_too_short(self):
        is_valid, error = validate_author("А")
        self.assertFalse(is_valid)
        self.assertIn("3 символов", error)


class TestBookTitleField(unittest.TestCase):
    def test_valid_title(self):
        data = {'author': 'Тест', 'book_title': 'Война и мир', 'rating': '5', 
                'review_text': 'Хорошая книга, очень понравилась.', 'phone': '+79001234567'}
        self.assertNotIn('book_title', validate_review_form(data))

    def test_title_invalid_short(self):
        data = {'author': 'Тест', 'book_title': 'Go', 'rating': '5', 
                'review_text': 'Хорошая книга, очень понравилась.', 'phone': '+79001234567'}
        self.assertIn('book_title', validate_review_form(data))


class TestReviewTextField(unittest.TestCase):
    def test_valid_text(self):
        is_valid, _ = validate_description("Глубокий философский роман, заставляет задуматься.")
        self.assertTrue(is_valid)

    def test_text_invalid_few_letters(self):
        is_valid, error = validate_description("Норм ок")
        self.assertFalse(is_valid)
        self.assertIn("минимум", error)


class TestRatingField(unittest.TestCase):
    def test_valid_rating(self):
        is_valid, _ = validate_rating("7")
        self.assertTrue(is_valid)

    def test_rating_invalid_range(self):
        self.assertFalse(validate_rating("12")[0])
        self.assertFalse(validate_rating("-1")[0])

    def test_rating_invalid_type(self):
        is_valid, error = validate_rating("пять")
        self.assertFalse(is_valid)
        self.assertIn("целым числом", error)


class TestPhoneField(unittest.TestCase):
    """Телефон: ≥2 unit-теста, проверка форматов и длины"""
    def test_valid_phone_clean(self):
        self.assertTrue(validate_phone("+79001234567")[0])

    def test_valid_phone_formatted(self):
        self.assertTrue(validate_phone("+7 (900) 123-45-67")[0])

    def test_phone_invalid_length(self):
        is_valid, error = validate_phone("+7900")
        self.assertFalse(is_valid)
        self.assertIn("11 цифр", error)

    def test_phone_empty_required(self):
        is_valid, error = validate_phone("")
        self.assertFalse(is_valid)
        self.assertIn("обязательно", error)


class TestReviewFormIntegration(unittest.TestCase):
    def test_all_fields_valid(self):
        data = {
            'author': 'Петров Иван', 'book_title': 'Война и мир', 'rating': '9',
            'review_text': 'Классическое произведение, обязательно к прочтению.',
            'phone': '+7 (999) 111-22-33'
        }
        self.assertEqual(len(validate_review_form(data)), 0)

    def test_multiple_errors_collected(self):
        data = {
            'author': 'J.Doe', 'book_title': 'x', 'rating': 'abc',
            'review_text': 'test', 'phone': ''
        }
        errors = validate_review_form(data)
        self.assertEqual(len(errors), 5)
        for field in data:
            self.assertIn(field, errors)


if __name__ == '__main__':
    # verbosity=2 выводит имя каждого теста в консоли VS / Test Explorer
    unittest.main(verbosity=2)