"""Unittest script."""
# %%
import os
import unittest
os.environ['PYTHON_ENV'] = 'test'

# %%


def suite():
    """Test suite."""
    suite = unittest.TestSuite()

    from template_python.unittest.template_python_test\
        import TestTemplatePythonModule
    suite.addTests(unittest.TestLoader().loadTestsFromTestCase(
        TestTemplatePythonModule)
    )

    return suite

# %%


if __name__ == '__main__':
    unittest.TextTestRunner(verbosity=2).run(suite())
