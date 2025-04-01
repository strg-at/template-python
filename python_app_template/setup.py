"""Python App Template setup."""

import loguru as lg


def setup_logging() -> None:
    """Configure the logging format and level."""
    lg.logger.remove()  # Remove default logger
    lg.logger.add(
        sink=lambda msg: print(msg, end=""),  # Example sink, can be replaced with a file or other destination
        format="{time:YYYY-MM-DD HH:mm:ss} [{level}] {name}: {message}",
        level="INFO",
    )


def setup_app() -> None:
    """Configure the application."""
    setup_logging()
    lg.logger.info("Setting up the application")
