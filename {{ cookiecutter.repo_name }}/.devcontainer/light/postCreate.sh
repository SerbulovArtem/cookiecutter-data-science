#!/usr/bin/env bash
set -euo pipefail

cd /workspaces/{{ cookiecutter.repo_name }}

PYTHON_BIN="python"
echo "Using interpreter: ${PYTHON_BIN}"
"${PYTHON_BIN}" -V

# Ensure pip is present/updated, then install the project in editable mode.
"${PYTHON_BIN}" -m pip install --upgrade pip
"${PYTHON_BIN}" -m pip install -e .

# Sanity check
"${PYTHON_BIN}" -c "import sys; print('executable:', sys.executable)"

# Install pre-commit hooks
pre-commit install
