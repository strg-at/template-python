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
- [Production](#production)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
</details>
<!-- markdownlint-restore -->

A Python app that reticulates splines.

## Installing

To build this package, run:

```sh
uv sync
```

## Development

### API

To develop the API has hot reload server use the Task command

```sh
task dev:api
```

### CLI

```sh
task dev:cli -- --help
```

## Production

In production the api should be started with

```sh
uv run gunicorn python_app_template.api:app -k uvicorn.workers.UvicornWorker
```
