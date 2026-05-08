# -*- coding: utf-8 -*-
import unittest
import sys
from pathlib import Path

# Добавляем корень проекта
sys.path.insert(0, str(Path(__file__).parent.parent))

from validator import (
    validate_book_title, validate_book_description, 
     validate_book_date, validate_age_rating, validate_cover
)


# =========================================
# ТЕСТЫ НАЗВАНИЯ КНИГИ
# =========================================

class TestBookTitle(unittest.TestCase):
    """Тесты названия книги"""

    def test_valid_title(self):
        is_valid, _ = validate_book_title("Кладбище домашних животных")
        self.assertTrue(is_valid)

    def test_empty_title(self):
        is_valid, _ = validate_book_title("")
        self.assertFalse(is_valid)

    def test_short_title(self):
        is_valid, _ = validate_book_title("О")
        self.assertFalse(is_valid)

    def test_digits_only(self):
        is_valid, _ = validate_book_title("123456")
        self.assertFalse(is_valid)

    def test_invalid_symbols(self):
        is_valid, _ = validate_book_title("Оно@@@")
        self.assertFalse(is_valid)


# =========================================
# ТЕСТЫ ОПИСАНИЯ КНИГИ
# =========================================

class TestBookDescription(unittest.TestCase):
    """Тесты описания книги"""

    def test_valid_description(self):
        text = "Очень страшная и атмосферная книга про древнее зло"
        is_valid, _ = validate_book_description(text)
        self.assertTrue(is_valid)

    def test_empty_description(self):
        is_valid, _ = validate_book_description("")
        self.assertFalse(is_valid)

    def test_short_description(self):
        is_valid, _ = validate_book_description("Страшно")
        self.assertFalse(is_valid)

    def test_digits_only(self):
        is_valid, _ = validate_book_description("123456789123456789")
        self.assertFalse(is_valid)

    def test_too_many_digits(self):
        is_valid, _ = validate_book_description(
            "1234567890 1234567890 книга"
        )
        self.assertFalse(is_valid)


# =========================================
# ТЕСТЫ ДАТЫ ВЫХОДА
# =========================================

class TestBookDate(unittest.TestCase):
    """Тесты даты выхода книги"""

    def test_valid_date(self):
        is_valid, _ = validate_book_date("2005-06-15")
        self.assertTrue(is_valid)

    def test_empty_date(self):
        is_valid, _ = validate_book_date("")
        self.assertFalse(is_valid)

    def test_invalid_format(self):
        is_valid, _ = validate_book_date("15.06.2005")
        self.assertFalse(is_valid)

    def test_too_old_date(self):
        is_valid, _ = validate_book_date("1800-01-01")
        self.assertFalse(is_valid)

    def test_too_far_future(self):
        is_valid, _ = validate_book_date("2099-01-01")
        self.assertFalse(is_valid)


# =========================================
# ТЕСТЫ ВОЗРАСТНОГО РЕЙТИНГА
# =========================================

class TestAgeRating(unittest.TestCase):
    """Тесты возрастного рейтинга"""

    def test_valid_rating(self):
        is_valid, _ = validate_age_rating("18+")
        self.assertTrue(is_valid)

    def test_invalid_rating(self):
        is_valid, _ = validate_age_rating("21+")
        self.assertFalse(is_valid)

    def test_empty_rating(self):
        is_valid, _ = validate_age_rating("")
        self.assertFalse(is_valid)


# =========================================
# ТЕСТЫ ОБЛОЖКИ
# =========================================

class FakeUpload:
    """Фейковый upload для тестов"""

    def __init__(self, filename):
        self.filename = filename

        from io import BytesIO
        self.file = BytesIO(b"fake image content")

class TestCoverValidation(unittest.TestCase):
    """Тесты загрузки обложки"""

    def test_valid_cover(self):
        upload = FakeUpload("cover.jpg")
        is_valid, _ = validate_cover(upload)
        self.assertTrue(is_valid)

    def test_invalid_extension(self):
        upload = FakeUpload("virus.exe")
        is_valid, _ = validate_cover(upload)
        self.assertFalse(is_valid)

    def test_empty_filename(self):
        upload = FakeUpload("")
        is_valid, _ = validate_cover(upload)
        self.assertFalse(is_valid)

    def test_none_cover(self):
        is_valid, _ = validate_cover(None)
        self.assertFalse(is_valid)
         

# =========================================
# ЗАПУСК
# =========================================

if __name__ == '__main__':
    unittest.main()

