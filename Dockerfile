FROM python:3.12-alpine

RUN apk update && apk add --no-cache \
    uv \
    postgresql-client

WORKDIR /app

COPY . .

RUN adduser -S strg \
    && chown -R strg /app

USER strg

ENV PATH="/app/.venv/bin:$PATH"

RUN uv sync --frozen --no-dev
