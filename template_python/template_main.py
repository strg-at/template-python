from typing import Dict
import json


def read_json_file(filename: str) -> Dict:
    """Read json file.

    Args:
        filename (str): _description_

    Returns:
        Dict: _description_
    """
    with open(filename, "r") as f:
        json_data = json.load(f)
    return json_data
