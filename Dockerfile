FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY . /app

RUN pip install --no-cache-dir ./src/backend/base

EXPOSE 7860

CMD ["python", "-m", "uvicorn", "langflow.main:create_app", "--factory", "--host", "0.0.0.0", "--port", "7860"]
