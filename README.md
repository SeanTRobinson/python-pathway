# python-pathway

Python AI Engineering Learning Program - A project-based learning journey for mastering Python and AI engineering.

## Setup

### Prerequisites

- Python 3.11 or higher
- pip (Python package manager)

### Installation

1. **Create a virtual environment** (recommended):
   ```bash
   python -m venv venv
   # On Windows:
   venv\Scripts\activate
   # On macOS/Linux:
   source venv/bin/activate
   ```

2. **Install development dependencies**:
   ```bash
   pip install -r requirements-dev.txt
   # Or using make:
   make install-dev
   ```

3. **Verify installation**:
   ```bash
   pytest  # Run tests
   ruff check .  # Check linting
   mypy python_pathway  # Check types
   ```

## Development Tools

This project uses modern Python tooling:

- **Ruff**: Fast Python linter and formatter (replaces pylint, flake8, black, isort)
- **MyPy**: Static type checker with strict mode
- **Pytest**: Testing framework with coverage reporting
- **pytest-cov**: Code coverage analysis

### Common Commands

Using make:
```bash
make test         # Run tests with coverage
make lint         # Run linter
make format       # Format code
make type-check   # Check types
make check        # Run all checks
make help         # Show all commands
```

Or run directly:
```bash
pytest                    # Run tests
ruff check .              # Lint code
ruff format .             # Format code
mypy python_pathway       # Type check
```

## Project Structure

```
python-pathway/
├── python_pathway/      # Main package
├── tests/               # Test suite
├── pyproject.toml       # Project configuration
├── requirements-dev.txt # Development dependencies
└── Makefile            # Convenience commands
```