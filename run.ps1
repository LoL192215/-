# Create venv (if missing), install requirements and run uvicorn using the venv's python
if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Error "Python is not found in PATH. Install Python and enable 'Add Python to PATH'."
    exit 1
}

if (-not (Test-Path .venv)) {
    python -m venv .venv
}

$venvPython = Join-Path (Get-Location) '.venv\Scripts\python.exe'
& $venvPython -m pip install --upgrade pip
& $venvPython -m pip install -r requirements.txt
& $venvPython -m uvicorn app.main:app --reload --host 127.0.0.1 --port 8000
