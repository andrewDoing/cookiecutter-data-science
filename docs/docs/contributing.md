# Contributing

The Cookiecutter Data Science project is opinionated, but not afraid to be wrong. Best practices change, tools evolve, and lessons are learned. **The goal of this project is to make it easier to start, structure, and share an analysis.** [Pull requests](https://github.com/drivendataorg/cookiecutter-data-science/pulls) and [filing issues](https://github.com/drivendataorg/cookiecutter-data-science/issues) is encouraged. We'd love to hear what works for you, and what doesn't.

If you use the Cookiecutter Data Science project, link back to this page or [give us a holler](https://twitter.com/drivendataorg) and [let us know](mailto:info@drivendata.org)!

## Development Environment

To contribute to this project, we recommend using the provided development container configuration for a consistent development experience.

### Option 1: Using VS Code with Dev Containers (Recommended)

1. Install [Visual Studio Code](https://code.visualstudio.com/)
2. Install the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
3. Clone the repository and open it in VS Code
4. When prompted, click "Reopen in Container" or use `Ctrl+Shift+P` → "Dev Containers: Reopen in Container"

The dev container includes:
- Python 3.12
- All development dependencies pre-installed
- VS Code extensions for Python, Jupyter, Markdown, and more
- Configured linting and formatting with Ruff
- Port forwarding for documentation and development servers

### Option 2: Using GitHub Codespaces

1. Navigate to the [repository on GitHub](https://github.com/andrewDoing/cookiecutter-data-science)
2. Click the green "Code" button
3. Select the "Codespaces" tab
4. Click "Create codespace on main"

### Option 3: Manual Setup

If you prefer to set up your development environment manually:

1. Ensure you have Python 3.10+ installed
2. Clone the repository
3. Install development requirements: `pip install -r dev-requirements.txt`

### Development Commands

Once your environment is set up, you can use these Make commands:

```bash
make requirements          # Install Python dependencies
make format               # Format code with ruff
make lint                 # Lint code with ruff
make test                 # Run tests
make docs                 # Build documentation
make docs-serve           # Serve documentation locally (available at http://localhost:8000)
make devcontainer-build   # Build the dev container (requires Dev Containers CLI)
make devcontainer-up      # Start the dev container (requires Dev Containers CLI)
```

### Running Tests

Before submitting a pull request, make sure all tests pass:

```bash
make test
```

For faster iteration during development:

```bash
make test-fastest
```

### Documentation

To work on documentation:

```bash
cd docs
mkdocs serve
```

The documentation will be available at http://localhost:8000 (this port is automatically forwarded in the dev container).

## Requesting New Tools

Requests for supporting new or alternative tools should be made in the [discussions section](https://github.com/drivendataorg/cookiecutter-data-science/discussions) of the repository. This allows for community input, upvotes, and better tracking of feature requests.

