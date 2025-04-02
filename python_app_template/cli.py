"""Python App Template CLI."""

import rich
import typer

app = typer.Typer()


@app.command()
def fire(name: str = "Chell") -> None:
    """Fire portal gun.

    Parameters
    ----------
    name : str
        The name of the individual firing the portal gun (default is "Chell").

    Returns
    -------
    None
    """
    rich.print(f"[bold red]Alert![/bold red] {name} fired [green]portal gun[/green] :boom:")
