"""Python App Template setup."""

import loguru


def setup_logging() -> None:
    """Configure the logging format and level.

    This function removes the default loguru logger and adds a new sink that outputs
    to the console with the specified format and logging level.
    """
    loguru.logger.remove()  # Remove default logger
    loguru.logger.add(
        sink=lambda msg: print(msg, end=""),  # Example sink; can be replaced with a file or other destination
        format="{time:YYYY-MM-DD HH:mm:ss} [{level}] {name}: {message}",
        level="INFO",
    )
