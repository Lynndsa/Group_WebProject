import unittest
import validator as val

class Test_test_articles(unittest.TestCase):
    def test_title_T(self):
        list_title_T = [
            "An",
            "",
            "AJ",
            "Ken"
        ]
        for title in list_title_T:
            self.assertTrue(val.validate_title(title))
    def test_title_F(self):
        list_title_F = [
            "3",
            "1",
            "2",
            "9",
            "  d  "
        ]
        for title in list_title_F:
            self.assertFalse(val.validate_title(title))
if __name__ == '__main__':
    unittest.main()
