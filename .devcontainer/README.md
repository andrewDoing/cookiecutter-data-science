# Dev Container for Cookiecutter Data Science

This directory contains the development container configuration for the Cookiecutter Data Science project. The dev container provides a consistent, reproducible development environment that works with Visual Studio Code, GitHub Codespaces, and other dev container-compatible tools.

## What's Included

- **Python 3.12** - The same version specified in the project Makefile
- **Pre-installed extensions** for VS Code:
  - Python support with debugging and linting
  - Ruff for code formatting and linting
  - Jupyter notebook support
  - Markdown editing tools
  - Makefile support
  - GitHub Actions support
- **Development tools**:
  - Git and GitHub CLI
  - Node.js 18 for documentation tools
  - All project dependencies from `dev-requirements.txt`

## Using the Dev Container

### With VS Code

1. Install the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
2. Open this project in VS Code
3. When prompted, click "Reopen in Container" or use the command palette: `Dev Containers: Reopen in Container`

### With GitHub Codespaces

1. Navigate to the repository on GitHub
2. Click the green "Code" button
3. Select the "Codespaces" tab
4. Click "Create codespace on main"

### With Dev Containers CLI

```bash
# Install the CLI
npm install -g @devcontainers/cli

# Start the dev container
devcontainer up --workspace-folder .

# Execute commands in the container
devcontainer exec --workspace-folder . make test
```

## Available Development Commands

Once inside the dev container, you can use all the standard Make commands:

```bash
make create_environment     # Create conda environment
make create_environment_uv  # Create uv virtual environment  
make requirements          # Install Python dependencies
make format               # Format code with ruff
make lint                 # Lint code with ruff
make test                 # Run tests
make docs                 # Build documentation
make docs-serve           # Serve documentation locally
```

## Ports

The following ports are automatically forwarded from the container to your local machine:

- **8000** - MkDocs documentation server
- **8080** - General web development
- **5000** - Flask/web application development

## Environment Variables

- `PYTHONPATH` - Set to the workspace folder for proper Python imports
- `PROJECT_NAME` - Set to "cookiecutter-data-science"

## Customization

To modify the dev container configuration:

1. Edit `.devcontainer/devcontainer.json`
2. Rebuild the container: `Dev Containers: Rebuild Container` in VS Code command palette

For more information about dev containers, see the [official documentation](https://containers.dev/).
