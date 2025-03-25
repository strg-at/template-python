# syntax=docker/dockerfile:1

#############################
# Development Image (dev)
#############################
FROM python:3.12-slim AS dev

# Install essential packages (sudo, git, curl, build tools) with apt cache mounts.
RUN apt-get update && \
    apt-get install -y --no-install-recommends sudo git curl build-essential && \
    rm -rf /var/lib/apt/lists/*

# Tell Git that the workspace is safe.
RUN git config --system --add safe.directory '*'

# Create a non-root user with passwordless sudo (for VS Code Dev Container compatibility).
RUN groupadd --gid 1000 user && \
    useradd --create-home --no-log-init --uid 1000 --gid 1000 --shell /bin/bash user && \
    echo 'user ALL=(ALL) NOPASSWD:ALL' | tee /etc/sudoers.d/user && \
    chmod 0440 /etc/sudoers.d/user

USER user

# Configure the non-root user's shell (history and Starship prompt).
RUN mkdir -p /home/user/.history && \
    echo 'HISTFILE=/home/user/.history/.bash_history' >> /home/user/.bashrc && \
    echo 'bind "\"\e[A\": history-search-backward"' >> /home/user/.bashrc && \
    echo 'bind "\"\e[B\": history-search-forward"' >> /home/user/.bashrc && \
    echo 'eval "$(starship init bash)"' >> /home/user/.bashrc

# Set the working directory as expected by VS Code Dev Containers.
WORKDIR /workspaces/python-app-template

# Install Poetry using pip.
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/home/user/.local/bin:$PATH" \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_NO_INTERACTION=1

# Copy dependency specification files first to leverage Docker layer caching.
COPY --chown=user:user pyproject.toml poetry.lock* ./

# Install all dependencies (including dev dependencies) using Poetry.
# A cache mount is used to speed up repeated installs.
RUN --mount=type=cache,target=/home/user/.cache/pypoetry \
    poetry install

# Copy the remainder of the source code.
COPY --chown=user:user . .

# Ensure the virtual environment's binaries are in PATH.
ENV PATH="/workspaces/python-app-template/.venv/bin:$PATH"

# For VS Code dev containers, the default command is to launch an interactive shell.
CMD ["bash"]

#############################
# Runtime Image (app)
#############################
FROM python:3.12-slim AS app

# Minimal runtime: install only essential system dependencies.
RUN apt-get update && \
    apt-get install -y --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Create a non-root user for security.
RUN groupadd --gid 1000 user && \
    useradd --create-home --no-log-init --uid 1000 --gid 1000 user
USER user

WORKDIR /app

# Copy the entire application (including the in‑project virtual environment) from the dev stage.
COPY --from=dev /workspaces/python-app-template /app

# Ensure the virtual environment's binaries are available.
ENV PATH="/app/.venv/bin:$PATH"

# Expose the CLI command as the container entrypoint.
ENTRYPOINT ["python-app-template"]
CMD []
