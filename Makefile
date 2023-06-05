target_dirs := tests frogger 

install:
	python3 -m venv .venv
	.venv/bin/pip install -e .[dev]
	@echo "\nRun 'source .venv/bin/activate' to activate virtualenv."

serve:
	.venv/bin/uvicorn frogger.server:app

format:
	black ${target_dirs}
	isort ${target_dirs}

lint:
	ruff ${target_dirs}
	black ${target_dirs} --check
	isort ${target_dirs} --check-only

clean:
	find frogger -name "*.pyc" -exec rm {} +
	find frogger -name "__pycache__" -prune -exec rm -r {} +
	rm -rf *.egg-info build dist
	