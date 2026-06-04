@echo off
where python >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
  echo Python not found in PATH. Install Python and enable "Add Python to PATH".
  exit /b 1
)

if not exist .venv (
  python -m venv .venv
)

.venv\Scripts\python -m pip install --upgrade pip
.venv\Scripts\python -m pip install -r requirements.txt
.venv\Scripts\python -m uvicorn app.main:app --reload --host 127.0.0.1 --port 8000
