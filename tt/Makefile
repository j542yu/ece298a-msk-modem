
SHELL := /bin/bash

.PHONY: all setup harden warnings copy clean

all: setup generate_def harden warnings copy

# Activate the virtual environment and check PDK variables
setup:
	@source venv/bin/activate && \
	echo "PDK_ROOT=$$PDK_ROOT" && \
	echo "PDK=$$PDK" && \
	if [[ -z "$$PDK_ROOT" || -z "$$PDK" ]]; then \
		echo "ERROR: PDK_ROOT and PDK must both be set."; \
		exit 1; \
	fi && \
	export LIBRELANE_TAG=3.0.14 && \
	pip install -r requirements.txt && \
	pip install librelane==$$LIBRELANE_TAG

generate_def:
	@source venv/bin/activate && \
	cd tech/$$PDK/def && \
	python3 generate_def.py

# Generate user configuration
harden-config:
	@source venv/bin/activate && \
	cd .. && \
	./tt/tt_tool.py --pdk "$$PDK" --create-user-config

# Run hardening
harden: setup harden-config
	@source venv/bin/activate && \
	cd .. && \
	./tt/tt_tool.py --pdk "$$PDK" --harden

# Print warnings
warnings:
	@source venv/bin/activate && \
	cd .. && \
	./tt/tt_tool.py --pdk "$$PDK" --print-warnings

# Copy final layout outputs
copy:
	@mkdir -p ../mag ../gds ../lef
	@cp -av ../runs/wokwi/final/mag/* ../mag/
	@cp -av ../runs/wokwi/final/gds/* ../gds/
	@cp -av ../runs/wokwi/final/klayout_gds/* ../gds/
	@cp -av ../runs/wokwi/final/mag_gds/* ../gds/
	@cp -av ../runs/wokwi/final/lef/* ../lef/

clean:
	rm -rf ../mag/* ../gds/* ../lef/*
