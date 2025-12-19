.PHONY: help install install-dev test lint format type-check check clean

# Detect virtual environment and use its Python/pip if available
ifeq ($(OS),Windows_NT)
	VENV_BIN = venv\Scripts
	PYTHON = $(if $(wildcard venv\Scripts\python.exe),venv\Scripts\python.exe,python)
	PIP = $(if $(wildcard venv\Scripts\pip.exe),venv\Scripts\pip.exe,pip)
	PYTEST = $(if $(wildcard venv\Scripts\pytest.exe),venv\Scripts\pytest.exe,pytest)
	RUFF = $(if $(wildcard venv\Scripts\ruff.exe),venv\Scripts\ruff.exe,ruff)
	MYPY = $(if $(wildcard venv\Scripts\mypy.exe),venv\Scripts\mypy.exe,mypy)
else
	VENV_BIN = venv/bin
	PYTHON = $(if $(wildcard venv/bin/python),venv/bin/python,python)
	PIP = $(if $(wildcard venv/bin/pip),venv/bin/pip,pip)
	PYTEST = $(if $(wildcard venv/bin/pytest),venv/bin/pytest,pytest)
	RUFF = $(if $(wildcard venv/bin/ruff),venv/bin/ruff,ruff)
	MYPY = $(if $(wildcard venv/bin/mypy),venv/bin/mypy,mypy)
endif

help:
	@echo "Available commands:"
	@echo "  make install      - Install project dependencies"
	@echo "  make install-dev  - Install development dependencies"
	@echo "  make test         - Run tests with coverage"
	@echo "  make lint         - Run ruff linter"
	@echo "  make format       - Format code with ruff"
	@echo "  make type-check   - Run mypy type checker"
	@echo "  make check        - Run all checks (lint, type-check, test)"
	@echo "  make clean        - Clean cache and build files"

install:
	$(PIP) install -e .

install-dev:
	$(PIP) install -e ".[dev]"

test:
	$(PYTEST)

lint:
	$(RUFF) check .

format:
	$(RUFF) format .

type-check:
	$(MYPY) python_pathway

check: lint type-check test
	@echo "All checks passed!"

clean:
	rm -rf build dist *.egg-info .pytest_cache .mypy_cache .ruff_cache htmlcov .coverage
	find . -type d -name __pycache__ -exec rm -r {} +
	find . -type f -name "*.pyc" -delete

