# Python App Template

<!-- markdownlint-disable-next-line line-length -->
[![Open in Dev Containers](https://img.shields.io/static/v1?label=Dev%20Containers&message=Open&color=blue&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0iI2ZmZiIgZD0iTTE3IDE2VjdsLTYgNU0yIDlWOGwxLTFoMWw0IDMgOC04aDFsNCAyIDEgMXYxNGwtMSAxLTQgMmgtMWwtOC04LTQgM0gzbC0xLTF2LTFsMy0zIi8+PC9zdmc+)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/strg-at/template-python) [![Open in GitHub Codespaces](https://img.shields.io/static/v1?label=GitHub%20Codespaces&message=Open&color=blue&logo=github)](https://github.com/codespaces/new/strg-at/template-python)

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
<summary>Prerequisites</summary>

1. [Generate an SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key) and [add the SSH key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).
2. Configure SSH to automatically load your SSH keys:

    ```sh
    cat << EOF >> ~/.ssh/config

    Host *
      AddKeysToAgent yes
      IgnoreUnknown UseKeychain
      UseKeychain yes
      ForwardAgent yes
    EOF
    ```

3. [Install Docker Desktop](https://www.docker.com/get-started).
4. [Install VS Code](https://code.visualstudio.com/) and [VS Code's Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers). Alternatively, install [PyCharm](https://www.jetbrains.com/pycharm/download/).
5. _Optional:_
   1. Install a [Nerd Font](https://www.nerdfonts.com/font-downloads) such as [FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)
   2. [Configure VS Code](https://github.com/tonsky/FiraCode/wiki/VS-Code-Instructions) or [PyCharm](https://github.com/tonsky/FiraCode/wiki/Intellij-products-instructions) to use it.

<details open>
<summary>Development environments</summary>

The following development environments are supported:

1. ⭐️ _GitHub Codespaces_: Click on [Open in GitHub Codespaces](https://github.com/codespaces/new/strg-at/template-python) to start developing in your browser.
2. ⭐️ _VS Code Dev Container (with container volume)_:
   - Click on [Open in Dev Containers](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/strg-at/template-python) to clone this repository in a container volume and create a Dev Container with VS Code. <!-- markdownlint-disable-line line-length -->
3. ⭐️ _Poetry_: Clone this repository and run the following from the root of the repository:

    ```sh
    # Install project dependencies
    poetry install

    # Activate the virtual environment
    ./activate.sh

    # Install the pre-commit hooks
    task pre-commit:init
    ```

4. _VS Code Dev Container_: Clone this repository, open it with VS Code, and run <kbd>Ctrl/⌘</kbd> + <kbd>⇧</kbd> + <kbd>P</kbd> → _Dev Containers: Reopen in Container_.
5. _PyCharm Dev Container_: Clone this repository, open it with PyCharm, [create a Dev Container with Mount Sources](https://www.jetbrains.com/help/pycharm/start-dev-container-inside-ide.html), and [configure an existing Python interpreter](https://www.jetbrains.com/help/pycharm/configuring-python-interpreter.html#widget) at `/opt/venv/bin/python`. <!-- markdownlint-disable-line line-length -->

</details>

<details>
<summary>Developing</summary>

- This project follows the [Conventional Commits](https://www.conventionalcommits.org/) standard to automate [Semantic Versioning](https://semver.org/) and [Keep A Changelog](https://keepachangelog.com/) with [Commitizen](https://github.com/commitizen-tools/commitizen).
- Run `poe` from within the development environment to print a list of [Poe the Poet](https://github.com/nat-n/poethepoet) tasks available to run on this project.
- Run `poetry add {package}` from within the development environment to install a runtime dependency and add it to `pyproject.toml`. Add `--dev` to install a development dependency.
- Run `poetry update` to upgrade all dependencies to the latest versions allowed by `pyproject.toml`.
- Run `cz bump` to bump the app's version, update the `CHANGELOG.md`, and create a git tag. Then push the changes and the git tag with `git push origin main --tags`.

</details>
<!-- markdownlint-restore -->
