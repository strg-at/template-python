import logging
import os
import sys

import structlog


def setup_logging():
    log_format = os.getenv("LOG_FORMAT", "simple").lower()

    logging.basicConfig(
        format="%(message)s",
        stream=sys.stdout,
        level=os.getenv("LOG_LEVEL", "DEBUG").upper(),
        force=True,
    )

    if log_format == "simple":
        processors = [
            structlog.processors.TimeStamper(fmt="iso", utc=True, key="timestamp"),
            structlog.stdlib.add_log_level,
            structlog.stdlib.PositionalArgumentsFormatter(),
            structlog.processors.StackInfoRenderer(),
            structlog.processors.format_exc_info,
            structlog.processors.dict_tracebacks,
            structlog.dev.ConsoleRenderer(colors=True),
        ]
    else:  # JSON (cloud/container) format
        processors = [
            structlog.processors.TimeStamper(fmt="iso", utc=True, key="timestamp"),
            structlog.stdlib.add_log_level,
            structlog.stdlib.PositionalArgumentsFormatter(),
            structlog.processors.StackInfoRenderer(),
            structlog.processors.format_exc_info,
            structlog.processors.dict_tracebacks,
            structlog.processors.EventRenamer("message"),
            lambda logger, method_name, event_dict: (
                event_dict.update(severity=event_dict.pop("level", None)) or event_dict
            ),
            structlog.processors.JSONRenderer(),
        ]

    structlog.configure(
        processors=processors,
        context_class=dict,
        logger_factory=structlog.stdlib.LoggerFactory(),
        wrapper_class=structlog.stdlib.BoundLogger,
        cache_logger_on_first_use=True,
    )
