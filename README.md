# Военные самолёты — FastAPI

Простой бэкенд на FastAPI с in-memory хранением данных о военных самолётах.

Запуск (рекомендуется в виртуальном окружении):

```bash
pip install -r requirements.txt
uvicorn app.main:app --reload
```

Эндпоинты:
- `GET /aircraft` — список самолётов
- `GET /aircraft/{id}` — получить самолёт по id
- `POST /aircraft` — создать самолёт (JSON: `name`, `country`, `role`, `year`)

Скрипты запуска для Windows:

- PowerShell: [run.ps1](run.ps1)
- CMD: [run.bat](run.bat)

## Деплой на Render

1. Откройте https://dashboard.render.com
2. Создайте новый **Web Service**
3. Подключите этот GitHub-репозиторий
4. Выберите **Python** как Runtime
5. Build command: `pip install -r requirements.txt`
6. Start command: `gunicorn -w 4 -k uvicorn.workers.UvicornWorker --bind 0.0.0.0:$PORT app.main:app`
7. Нажмите **Deploy**

Или Render автоматически распознает `Procfile` — просто залейте в репозиторий и деплойте.

После деплоя API будет доступен по URL вашего сервиса на Render.


