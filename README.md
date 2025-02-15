<!-- markdownlint-disable MD041 -->
<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD028 -->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

[![pre-commit][pre-commit-shield]][pre-commit-url]
[![taskfile][taskfile-shield]][taskfile-url]

# Project

Short project description

<details>
  <summary style="font-size:1.2em;">Table of Contents</summary>
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Code-Style](#code-style)
- [Getting Started](#getting-started)
  - [Using Poetry](#using-poetry)
  - [Prerequisties](#prerequisties)
  - [Initialize repository](#initialize-repository)
  - [Coverage report](#coverage-report)
  - [Pre-commit](#pre-commit)
- [Configuration](#configuration)
  - [Preparation](#preparation)
- [Known Issues](#known-issues)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
</details>

## Code-Style

<!-- TBD -->

## Getting Started

This Python project is managed via [Poetry](https://python-poetry.org/), and leverages the [pyproject.toml](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/)
configuration file, rather than the older `setup.py`.
The `pyproject.toml` configuration file can be and is also used to store 3rd party tools configurations, such as black, ruff, mypy etc.

### Using Poetry

In order to use poetry, you should [install it first](https://python-poetry.org/docs/#installing-with-pipx). If your OS package manager has
a `python-poetry` package, you might also choose to install Poetry that way. **Notice** that if you do this, you should make sure that your OS
also ships all the necessary plugins you might want to use (most importantly, `poetry-plugin-export`). As of the time of writing, Archlinux does.

#### Setup

Install the project, by using:

```bash
poetry install --with dev
```

This will install the necessary dependencies **plus the dev dependencies**, any binary shipped with the project, as well as create a dedicated virtual environment.  
The virtual environment can be activated with:

```bash
source $(poetry env info -p)/bin/activate
```

Alternatively, you can also source the script `activate.sh` in this repo:

```bash
source ./activate.sh
```

This has the advantage, over standard venvs management, that you don't need to remember the name of the environment for any project.
If you **don't want** the dev dependencies, simply install the project with `poetry install`.

You can also install the project with `pip`, since Poetry is [PEP-517 compliant](https://python-poetry.org/docs/pyproject/#poetry-and-pep-517):

```bash
pip install .
# OR, using git+ssh
pip install git+ssh://git@github.com:strg-at/template-python.git
```

#### Dependency management

To add a dependency, simply run:

```bash
poetry add 3rd-party-package
```

To remove a dependency, run:

```bash
poetry remove 3rd-party-package
```

To add a dev dependency, run:

```bash
poetry add dev-dep-package --group dev
```

In this template, we also create one (or more) additional dependency group(s) to deal with IDE specific dependencies.
For instance, if you want to use the [python-lsp-server](https://github.com/python-lsp/python-lsp-server), as well as installing
its plugins for `mypy` etc., then you can use the `lsp-dev` group.

```bash
poetry install --with dev --with lsp-dev
```

##### Generating a requirements.txt

You can also generate a `requirements.txt` with poetry. **NOTICE** that this is **not** mandatory at all, and should be done only for backward compatibility, IF necessary.
First, install the `poetry-plugin-export`.
This can be done in [several ways](https://python-poetry.org/docs/plugins/#using-plugins), depending on how you installed poetry.
If you installed poetry via your package manager, then you should install the plugin via your package manager. For instance, on Archlinux:

```bash
sudo pacman -S python-poetry-plugin-export
```

To generate the requirements, you can then run:

```bash
poetry export --without-hashes --format=requirements.txt > requirements.txt
```

#### Version management

Poetry has some nice shortcuts to manage the project version. You can see them by running

```bash
poetry version --help
```

For instance, bumping to the next minor version can be done with:

```bash
poetry version minor
```

This would be a project from, e.g., `1.2` to `1.3`. A major bump can be done with:

```bash
poetry version major
```

Poetry can do more than this, consult the [documentation for more information](https://python-poetry.org/docs/).

### Prerequisties

Install pre-commit.

- [pre-commit][pre-commit]
- [yamllint][yamllint]
- [taskfile][taskfile-url]

### Initialize repository

Pre-commit framework need to get initialized.

```console
task pre-commit:init
```

### Coverage report

Run coverage report.

```bash
sh ./coverage_report.sh
```

```bash
Name                                                                Stmts   Miss  Cover
---------------------------------------------------------------------------------------
template_python/template_python_package/template_python_module.py       6      0   100%
template_python/unittest/template_python_test.py                       18      1    94%
---------------------------------------------------------------------------------------
TOTAL                                                                  24      1    96%

```

### Pre-commit

Run the following to fix linting issues using pre-commit.

```bash
task pre-commit:run
```

Based on pre-commit gitleaks dependencies Go language needs to be installed.

## Configuration

### Preparation

All changes require a PR and review. Create a new branch and reference a Jira ticket, f.e.

```console
git switch -c feature/INPRO-1-configure-resource
```

## Known Issues

<!-- TBD -->

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- Links -->

[pre-commit]: https://pre-commit.com/
[yamllint]: https://github.com/adrienverge/yamllint

<!-- Badges -->

[pre-commit-shield]: https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit
[pre-commit-url]: https://github.com/pre-commit/pre-commit
[taskfile-url]: https://taskfile.dev/
[taskfile-shield]: https://img.shields.io/badge/Taskfile-Enabled-brightgreen?logo=task
