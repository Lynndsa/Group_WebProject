import unittest
import sys
from pathlib import Path

# Добавляем корень проекта в путь
sys.path.insert(0, str(Path(__file__).parent.parent))

import validator as val

class TestAuthorField_article(unittest.TestCase):
    """Тесты поля автора"""

    def test_valid_author(self):
        is_valid, _ = val.validate_author("Семен")
        self.assertTrue(is_valid)

    def test_nonvalid_author(self):
        is_valid, _ = val.validate_author("Andrey")
        self.assertFalse(is_valid)

    def test_short_author(self):
        is_valid, _ = val.validate_author("а")
        self.assertFalse(is_valid)

class TestTitleField_article(unittest.TestCase):
    """Тесты поля названия"""

    def test_valid_title(self):
        is_valid, _ = val.validate_title("Просмотр")
        self.assertTrue(is_valid)

    def test_short_title(self):
        is_valid, _ = val.validate_title("Прос")
        self.assertFalse(is_valid)

class TestTextField_article(unittest.TestCase):
    """Тесты поля описания"""

    def test_valid_text(self):
        # Используем validate_description с правильными параметрами
        # Минимум 10 русских букв по умолчанию
        is_valid, _ = val.validate_description("Описание маленькой статьи")
        self.assertTrue(is_valid)

    def test_nonvalid_text(self):
        # Латинские буквы не считаются
        is_valid, _ = val.validate_description("Description on stat")
        self.assertFalse(is_valid)
    
    def test_short_text(self):
        # Меньше 10 русских букв
        is_valid, _ = val.validate_description("Описание")
        self.assertFalse(is_valid)

class TestTelephoneField_article(unittest.TestCase):
    """Тесты для телефона"""

    # === ТЕСТЫ ДЛЯ ВАЛИДНЫХ ТЕЛЕФОНОВ ===
    
    def test_valid_telephone_with_plus7(self):
        """Тест: телефон с +7 и 10 цифрами"""
        result, message = val.validate_phone('+79161234567')
        self.assertTrue(result)
        self.assertIsNone(message)
    
    def test_valid_telephone_with_8(self):
        """Тест: телефон с 8 и 10 цифрами"""
        result, message = val.validate_phone('89161234567')
        self.assertTrue(result)
        self.assertIsNone(message)
    
    def test_valid_telephone_with_spaces(self):
        """Тест: телефон с пробелами"""
        result, message = val.validate_phone('+7 916 123 45 67')
        self.assertTrue(result)
        self.assertIsNone(message)
    
    def test_valid_telephone_with_dashes(self):
        """Тест: телефон с дефисами"""
        result, message = val.validate_phone('+7-916-123-45-67')
        self.assertTrue(result)
        self.assertIsNone(message)
    
    def test_valid_telephone_with_parentheses(self):
        """Тест: телефон со скобками"""
        result, message = val.validate_phone('+7 (916) 123-45-67')
        self.assertTrue(result)
        self.assertIsNone(message)
    
    def test_valid_telephone_mixed_format(self):
        """Тест: телефон со смешанными символами"""
        result, message = val.validate_phone('8 (916) 123-45-67')
        self.assertTrue(result)
        self.assertIsNone(message)

    # === ТЕСТЫ ДЛЯ НЕВАЛИДНЫХ ТЕЛЕФОНОВ ===
    
    def test_invalid_telephone_empty(self):
        """Тест: пустой телефон"""
        result, message = val.validate_phone('')
        self.assertFalse(result)
        self.assertEqual(message, 'Поле Телефон обязательно для заполнения')
    
    def test_invalid_telephone_short(self):
        """Тест: слишком короткий номер"""
        result, message = val.validate_phone('+7916123456')
        self.assertFalse(result)
        self.assertEqual(message, 'Телефон должен начинаться с +7 или 8 и содержать 11 цифр')
    
    def test_invalid_telephone_long(self):
        """Тест: слишком длинный номер"""
        result, message = val.validate_phone('+791612345678')
        self.assertFalse(result)
        self.assertEqual(message, 'Телефон должен начинаться с +7 или 8 и содержать 11 цифр')
    
    def test_invalid_telephone_wrong_code(self):
        """Тест: неверный код страны (не +7 и не 8)"""
        result, message = val.validate_phone('+19161234567')
        self.assertFalse(result)
        self.assertEqual(message, 'Телефон должен начинаться с +7 или 8 и содержать 11 цифр')
    
    def test_invalid_telephone_no_plus(self):
        """Тест: номер с 9 без плюса"""
        result, message = val.validate_phone('9161234567')
        self.assertFalse(result)
        self.assertEqual(message, 'Телефон должен начинаться с +7 или 8 и содержать 11 цифр')
    
if __name__ == '__main__':
    unittest.main()