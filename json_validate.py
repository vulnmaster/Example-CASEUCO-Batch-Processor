import json
from pathlib import Path
import jsonschema
import sys

# Get the path to the schema and file from the positional arguments
if len(sys.argv) != 3:
    print("Usage: python json_validate.py <data_path> <schema_path>")
    sys.exit(1)

data_path: str = sys.argv[1]
schema_path: str = sys.argv[2]

# Define the schema by loading it in from schema/schema.json
with open(schema_path, "r") as schema_file:
    schema = json.load(schema_file)

# Define the data by loading it in from data/data.json
with open(data_path, "r") as data_file:
    data = json.load(data_file)

# Validate the data against the schema
jsonschema.validate(instance=data, schema=schema)