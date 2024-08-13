FROM python:3.10-alpine

WORKDIR /workspace

RUN apk add --no-cache \
    build-base \
    libffi-dev \
    openssl-dev \
    py3-pip \
    bash

RUN pip install --no-cache-dir poetry

RUN poetry config virtualenvs.create false
COPY pyproject.toml poetry.lock .
RUN poetry install --no-dev

COPY omnistore/ omnistore/
WORKDIR /workspace/omnistore

CMD ["poetry", "run", "python", "main.py"]
