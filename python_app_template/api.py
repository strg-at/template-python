"""Python App Template REST API."""

import asyncio

import fastapi
import prometheus_fastapi_instrumentator

app = fastapi.FastAPI()

prometheus_fastapi_instrumentator.Instrumentator().instrument(app).expose(app)


@app.get("/compute")
async def compute(n: int = 42) -> int:
    """Compute the result of a CPU-bound function.

    Parameters
    ----------
    n : int
        The integer input for which Fibonacci is computed. Default is 42.

    Returns
    -------
    int
        The computed Fibonacci number.
    """

    def fibonacci(n: int) -> int:
        """Compute Fibonacci number recursively.

        Parameters
        ----------
        n : int
            The index in the Fibonacci sequence.

        Returns
        -------
        int
            Fibonacci number at position n.
        """
        return n if n <= 1 else fibonacci(n - 1) + fibonacci(n - 2)

    result = await asyncio.to_thread(fibonacci, n)
    return result
