"""Python App Template CLI."""

import typer
from rich import print as rprint

app = typer.Typer()


@app.command()
def fire(name: str = "Chell") -> None:
    """Fire portal gun."""
    rprint(f"[bold red]Alert![/bold red] {name} fired [green]portal gun[/green] :boom:")
