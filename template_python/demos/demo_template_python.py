"""Demo example to use template_python_module."""

import template_python.template_python_package.template_python_module as tpm

from pprint import pprint


filename = "template_python/mock_data/mock_web_portal.json"

mock_json_data = tpm.read_json_file(
    filename=filename
)

print(f"Datatype: {type(mock_json_data)}")
pprint(mock_json_data)