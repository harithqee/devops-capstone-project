FROM python:3.9-slim
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt
COPY service ./service
USER 1001
EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "service:app"]
