FROM python:3.13-alpine AS base

COPY --from=ghcr.io/astral-sh/uv:0.8.22@sha256:9874eb7afe5ca16c363fe80b294fe700e460df29a55532bbfea234a0f12eddb1 /uv /uvx /bin/

WORKDIR /app

# Todo: copying the code in the end, would reduce build times, when only code changes
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
