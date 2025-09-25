FROM python:3.13-alpine AS base

RUN apk update && apk add --no-cache \
    uv

WORKDIR /app

COPY . .

RUN adduser -S strg \
    && chown -R strg /app

USER strg

# This makes sure the correct venv binaries will be used
ENV PATH="/app/.venv/bin:$PATH"
ENV UV_LINK_MODE="copy"
ENV UV_COMPILE_BYTECODE=1
ENV PYTHONUNBUFFERED=1

# Development stage
FROM base AS development
RUN uv sync --dev


# Run tests, linters, type checkers, etc.
FROM development AS test

RUN uv run ruff check .
RUN uv run ruff format --check .
RUN uv run basedpyright .
RUN uv run pytest


# Production stage - will be built by default (last stage)
FROM base AS production
RUN uv sync --frozen --no-dev
