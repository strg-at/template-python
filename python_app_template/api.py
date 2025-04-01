"""Python App Template REST API."""

import asyncio

from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator as PrometheusInstrumentator

app = FastAPI()

PrometheusInstrumentator().instrument(app).expose(app)


@app.get("/compute")
async def compute(n: int = 42) -> int:
    """Compute the result of a CPU-bound function."""

    def fibonacci(n: int) -> int:
        return n if n <= 1 else fibonacci(n - 1) + fibonacci(n - 2)

    result = await asyncio.to_thread(fibonacci, n)
    return result
