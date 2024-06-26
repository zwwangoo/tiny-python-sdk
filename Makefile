.PHONY: docs init test flake8 clean build publish
init:
	pip install -U pip
	pip install -e .

test:
	@pip install tox
	@tox

flake8:
	flake8 --ignore=E501,F401,E128,E402,E731,F821 tiny_python_sdk

docs:
	@pip install sphinx sphinx_rtd_theme
	@cd docs && make html
	@echo "\033[95m\n\nBuild successful! View the docs homepage at docs/_build/html/index.html.\n\033[0m"

clean:
	@echo 'removing...'
	@find . -name 'dist' -print -exec rm -rf {} +
	@find . -name 'build' -print -exec rm -rf {} +
	@find . -name '.cache' -print -exec rm -rf {} +
	@find . -name '.eggs' -print -exec rm -rf {} +
	@find . -name '*.pyc' -print -exec rm -f {} +
	@find . -name '*.pyo' -print -exec rm -f {} +
	@find . -name '*.log' -print -exec rm -f {} +
	@find . -name '__pycache__' -print -exec rm -rf {} +
	@echo 'Done [clean]'

build: clean
	@pip install 'twine>=1.5.0' wheel
	@python setup.py sdist bdist_wheel
	@twine upload dist/*
	@make clean
