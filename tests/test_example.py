"""Example test file to verify testing setup."""

import pytest

from python_pathway import __version__


def test_version():
    """Test that version is defined."""
    assert __version__ == "0.1.0"


def test_example():
    """Example test to verify pytest is working."""
    assert 1 + 1 == 2

