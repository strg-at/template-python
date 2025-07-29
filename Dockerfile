FROM python:3.13-alpine AS base

RUN apk update && apk add --no-cache \
    uv \
    postgresql-client

WORKDIR /app

COPY . .

RUN adduser -S strg \
    && chown -R strg /app

USER strg

ENV PATH="/app/.venv/bin:$PATH"

# Development stage
FROM base AS dev
RUN uv sync

# Production stage
FROM base AS prod
RUN uv sync --frozen --no-dev
