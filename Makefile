.PHONY: _prep create_environment requirements format lint docs docs-serve test \
	test-fastest test-debug-fastest _clean_manual_test manual-test manual-test-debug \
	devcontainer-build devcontainer-up

## GLOBALS

PROJECT_NAME = cookiecutter-data-science
PYTHON_VERSION = 3.12
PYTHON_INTERPRETER = python


###     UTILITIES
_prep:
	rm -f **/*/.DS_store


###     DEV COMMANDS

## Set up python interpreter environment
create_environment:
	conda create --name $(PROJECT_NAME) python=$(PYTHON_VERSION) -y
	@echo ">>> conda env created. Activate with:\nconda activate $(PROJECT_NAME)"

## Set up python interpreter environment using uv
create_environment_uv:
	uv venv --python $(PYTHON_VERSION) .venv
	@echo ">>> uv virtual environment created. Activate with:\nsource .venv/bin/activate"

## Install Python Dependencies
requirements:
	$(PYTHON_INTERPRETER) -m pip install -r dev-requirements.txt

## Format the code using ruff
format:
	ruff check --fix ccds hooks tests docs/scripts
	ruff format ccds hooks tests docs/scripts

lint:
	ruff format --check ccds hooks tests docs/scripts
	ruff check ccds hooks tests docs/scripts

clean: clean-build clean-pyc clean-test ## remove all build, test, coverage and Python artifacts

clean-build: ## remove build artifacts
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +

clean-pyc: ## remove Python file artifacts
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean-test: ## remove test and coverage artifacts
	rm -fr .tox/
	rm -f .coverage
	rm -fr htmlcov/
	rm -fr .pytest_cache

dist: clean ## builds source and wheel package
	python -m build
	ls -l dist


###     DOCS

docs:
	cd docs && mkdocs build

docs-serve:
	cd docs && mkdocs serve

###     TESTS

test: _prep
	pytest -vvv --durations=0 tests

test-fastest: _prep
	pytest -vvv -FFF

test-debug-last:
	pytest --lf --pdb

_clean_manual_test:
	rm -rf manual_test

manual-test: _prep _clean_manual_test
	mkdir -p manual_test
	cd manual_test && python -m ccds ..

manual-test-debug: _prep _clean_manual_test
	mkdir -p manual_test
	cd manual_test && python -m pdb ../ccds/__main__.py ..


###     DEVELOPMENT CONTAINERS

## Build the dev container
devcontainer-build:
	@command -v devcontainer >/dev/null 2>&1 || { echo "Dev Containers CLI not found. Install with: npm install -g @devcontainers/cli"; exit 1; }
	devcontainer build --workspace-folder .

## Start the dev container
devcontainer-up:
	@command -v devcontainer >/dev/null 2>&1 || { echo "Dev Containers CLI not found. Install with: npm install -g @devcontainers/cli"; exit 1; }
	devcontainer up --workspace-folder .
