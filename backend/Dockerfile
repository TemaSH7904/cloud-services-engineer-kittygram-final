FROM python:3.9-slim

WORKDIR /app

# Устанавливаем зависимости
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt --no-cache-dir

# Копируем код приложения
COPY . .

# Запускаем gunicorn (Kittygram использует WSGI)
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "kittygram_backend.wsgi"]