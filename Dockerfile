FROM python:3.11-slim-buster

LABEL Name='Python Template Python'
LABEL Version=0.1
LABEL at.strg.docker.agents.maintainer=""
LABEL at.strg.docker.agents.vendor="STRG.AT GmbH"
LABEL at.strg.docker.agents.version="0.1"

WORKDIR app

COPY . .
RUN pip install -e .
RUN pip install -r requirements.txt
