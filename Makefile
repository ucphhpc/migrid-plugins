STATIC_DIR = './index'

.PHONE: build
build:
	@echo "Dumping package list"
	@ls -1 $(STATIC_DIR)/pool/ > ./input/packages.lst
	@echo "Generating index"
	@./envhelp/venv/bin/dumb-pypi \
		--package-list ./input/packages.lst \
		--packages-url '../../pool' \
		--output-dir $(STATIC_DIR)

.PHONY: development
development: ./envhelp/venv/pyvenv.cfg
	./envhelp/venv/bin/pip install -r local-requirements.txt

./envhelp/venv/pyvenv.cfg:
	python -m venv ./envhelp/venv
