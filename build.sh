#!/bin/bash
set -e
echo "=== CI build started ==="
date
python3 --version
python3 app.py
python3 test_app.py
echo "=== CI build finished ==="
