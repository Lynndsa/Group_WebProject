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

if __name__ == '__main__':
    unittest.main()