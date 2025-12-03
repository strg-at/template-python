# Python App Template

<!-- markdownlint-disable no-inline-html -->
<details>
  <summary style="font-size:1.2em;">Table of Contents</summary>
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Installing](#installing)
- [Development](#development)
  - [API](#api)
  - [CLI](#cli)
- [Local venv](#local-venv)
- [Production](#production)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
</details>
<!-- markdownlint-restore -->

A Python app that reticulates splines.

## Installing

Install the project dependencies in a virtual environment with:

```sh
uv sync
```

## Development

Install project dependencies including development tools and libraries:

```sh
uv sync --group dev
```

### API

To develop the API has hot reload server use the Task command

```sh
task devenv:api
```

### CLI

```sh
task devenv:cli -- --help
```

## Local venv

To activate venv run

```sh
source .venv/bin/activate
which python
```

deactivate

```sh
deactivate
```

## Production

In production the api should be started with

```sh
uv run gunicorn python_app_template.api:app -k uvicorn.workers.UvicornWorker
```
