FROM python:3.11-slim-buster

WORKDIR app

COPY . .
RUN pip install -e .
RUN pip install -r requirements.txt

RUN python -m unittest discover -s "test" -p "*test*.py"
