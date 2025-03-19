import logging

def setup_logging() -> None:
    """Configure the logging format and level."""
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s [%(levelname)s] %(name)s: %(message)s"
    )

def setup_app() -> None:
    """Configure the application."""
    setup_logging()
    logging.info("Setting up the application")
