# Python App Template

<!-- markdownlint-disable no-inline-html -->
<details>
  <summary style="font-size:1.2em;">Table of Contents</summary>
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Installing](#installing)
- [Using](#using)
- [Contributing](#contributing)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
</details>
<!-- markdownlint-restore -->

A Python app that reticulates splines.

## Installing

To install this package, run:

```sh
pip install python-app-template
```

Alternatively, if you are developing the project, install its dependencies with Poetry:

```sh
poetry install
```

## Using

To view the CLI help information, run:

```sh
python-app-template --help
```

## Contributing

<!-- markdownlint-disable no-inline-html -->
<details>
<summary>Development environments</summary>

The following development environments are supported:

1. ⭐️ _GitHub Codespaces_: Click on [Open in GitHub Codespaces](https://github.com/codespaces/new/strg-at/template-python) to start developing in your browser.
2. ⭐️ _Poetry_: Clone this repository and run the following from the root of the repository:

    ```sh
    # Install project dependencies
    poetry install

    # Activate the virtual environment
    ./activate.sh

    # Install the pre-commit hooks
    task pre-commit:init
    ```

3. _PyCharm Dev Container_: Clone this repository, open it with PyCharm, [create a Dev Container with Mount Sources](https://www.jetbrains.com/help/pycharm/start-dev-container-inside-ide.html), and [configure an existing Python interpreter](https://www.jetbrains.com/help/pycharm/configuring-python-interpreter.html#widget) at `/opt/venv/bin/python`. <!-- markdownlint-disable-line line-length -->

</details>

<details>
<summary>Developing</summary>

<!-- markdownlint-disable-next-line line-length -->
- This project follows the [Conventional Commits](https://strg-office.atlassian.net/wiki/spaces/TEC/pages/2549743760/GIT+Commit+Guidelines) standard to automate [Semantic Versioning](https://semver.org/) and [Keep A Changelog](https://keepachangelog.com/) with [Commitizen](https://github.com/commitizen-tools/commitizen).
- Run `poe` from within the development environment to print a list of [Poe the Poet](https://github.com/nat-n/poethepoet) tasks available to run on this project.
- Run `poetry add {package}` from within the development environment to install a runtime dependency and add it to `pyproject.toml`. Add `--dev` to install a development dependency.
- Run `poetry update` to upgrade all dependencies to the latest versions allowed by `pyproject.toml`.
- Run `cz bump` to bump the app's version, update the `CHANGELOG.md`, and create a git tag. Then push the changes and the git tag with `git push origin main --tags`.

</details>
<!-- markdownlint-restore -->
