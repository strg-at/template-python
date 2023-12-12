"""Unittest for template python module.py"""

import unittest

from template_python.template_python_package.template_python_module import read_json_file

from pprint import pprint


class TestTemplatePythonModule(unittest.TestCase):
    """Test Template Python Module."""

    def setUp(self) -> None:
        """Initialize variables for tests.

        Returns:
            _type_: _description_
        """
        print("Setup")
        self.filename = "template_python/mock_data/mock_web_portal.json"
        return super().setUp()

    def test_read_json_file(self):
        """Test read_json_file.

        Returns:
            _type_: _description_
        """
        test_num = 0
        print("Test read_json_file")
        test_num += 1
        result = read_json_file(self.filename)
        self.assertEqual(dict, type(result))
        print(f"Test number: {test_num}")
        pprint(result)


if __name__ == "__main__":
    # cd ../template-python
    # python -m unittest template_python/unittest/template_python_test.py
    # OR
    # the following can be used if no reference to files outside of the current
    # path
    # python -m unittest template_python_test.py
    # the above would not work because mock_web_portal.json is in a different
    # folder.
    unittest.main()
