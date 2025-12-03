FROM python:3.13.9-slim@sha256:326df678c20c78d465db501563f3492d17c42a4afe33a1f2bf5406a1d56b0e86 AS base
COPY --from=ghcr.io/astral-sh/uv:0.9.13@sha256:f07d1bf7b1fb4b983eed2b31320e25a2a76625bdf83d5ff0208fe105d4d8d2f5 /uv /uvx /bin/

WORKDIR /app

RUN useradd -m strg && \
    chown -R strg:strg /app

USER strg

COPY . .

ENV PATH="/app/.venv/bin:$PATH"
ENV UV_COMPILE_BYTECODE=1
ENV UV_LINK_MODE="copy"
ENV UV_NO_CACHE=1
ENV PYTHONUNBUFFERED=1

RUN uv sync --dev --frozen

# run linting and code quality checks
RUN uv run basedpyright .
RUN uv run ruff check --no-fix .
RUN uv run ruff format --check .

# run tests
RUN uv run pytest

FROM base AS build

USER strg

RUN uv sync --frozen --no-dev

FROM python:3.13.9-slim@sha256:326df678c20c78d465db501563f3492d17c42a4afe33a1f2bf5406a1d56b0e86 AS production

WORKDIR /app

RUN useradd -m strg && \
    chown -R strg:strg /app

USER strg

COPY --from=build /app/.venv ./.venv
COPY . .

ENV PATH="/app/.venv/bin:$PATH"
ENV PYTHONUNBUFFERED=1
