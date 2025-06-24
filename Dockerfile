FROM python:3.12-alpine

RUN apk add pipx

WORKDIR /app

COPY . .

RUN adduser -S strg \
      && chown -R strg /app

USER strg

ENV PATH="/home/strg/.local/bin:$PATH"
RUN pipx ensurepath && pipx install poetry==1.8.3 && poetry install

RUN poetry run python -m unittest discover -s "test" -p "*test*.py"

# EXPOSE <PORT NUMBER>
