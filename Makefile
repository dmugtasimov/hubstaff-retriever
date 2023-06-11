.PHONY: install
install:
	poetry install

.PHONY: install-pre-commit
install-pre-commit:
	poetry run pre-commit uninstall; poetry run pre-commit install

.PHONY: update
update: install install-pre-commit ;

.PHONY: lint
lint:
	poetry run pre-commit run --all-files

.PHONY: test
test:
	poetry run pytest -v --show-capture=no --tb=no

.PHONY: lint-and-test
lint-and-test: lint test ;
