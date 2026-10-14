#!/bin/bash
set -e
cd -- "$(dirname -- "$0")"
if [ ! -x .venv/bin/python ]; then
  python3 -m venv .venv
fi
if [ ! -f .venv/.requirements-installed ] || ! cmp -s requirements.txt .venv/.requirements-installed; then
  .venv/bin/python -m pip install -r requirements.txt
  cp requirements.txt .venv/.requirements-installed
fi
export MPLCONFIGDIR="$PWD/.cache/matplotlib"
echo "ブラウザで http://127.0.0.1:${PORT:-8000} を開いてください。終了は Ctrl+C。"
exec .venv/bin/python app.py
