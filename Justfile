# ------------------------------------------------------------------------------
# General Commands
# ------------------------------------------------------------------------------

clean:
    find . \( \
      -name '__pycache__' -o \
      -name '.coverage' -o \
      -name '.mypy_cache' -o \
      -name '.pytest_cache' -o \
      -name '.ruff_cache' -o \
      -name '*.pyc' -o \
      -name '*.pyd' -o \
      -name '*.pyo' -o \
      -name 'coverage.xml' -o \
      -name 'db.sqlite3' \
    \) -print | xargs rm -rfv

install:
    poetry install

test:
    poetry run pytest challenges --cov=challenges --cov-report=xml

# ------------------------------------------------------------------------------
# Ruff - # Set up red-knot when it's ready
# ------------------------------------------------------------------------------

ruff-fix:
    just ruff-lint-fix
    just ruff-format-fix

ruff-lint:
    poetry run ruff check .

ruff-lint-fix:
    poetry run ruff check . --fix

ruff-format:
    poetry run ruff format --check .

ruff-format-fix:
    poetry run ruff format .

# ------------------------------------------------------------------------------
# Prettier
# ------------------------------------------------------------------------------

prettier-check:
    prettier . --check

prettier-format:
    prettier . --check --write

# ------------------------------------------------------------------------------
# Justfile
# ------------------------------------------------------------------------------

format:
    just --fmt --unstable

format-check:
    just --fmt --check --unstable

# ------------------------------------------------------------------------------
# Git Hooks
# ------------------------------------------------------------------------------

# Install pre commit hook to run on all commits
install-git-hooks:
    cp -f githooks/pre-commit .git/hooks/pre-commit
    cp -f githooks/post-commit .git/hooks/post-commit
    chmod ug+x .git/hooks/*
