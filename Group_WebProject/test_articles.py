import unittest
import validator as val

class TestAuthorField_article(unittest.TestCase):
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
    def test_valid_title(self):
        is_valid, _ = val.validate_title("Просмотр")
        self.assertTrue(is_valid)
    def test_short_title(self):
        is_valid, _ = val.validate_title("Прос")
        self.assertFalse(is_valid)
if __name__ == '__main__':
    unittest.main()
