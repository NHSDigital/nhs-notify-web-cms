# This file is for you! Edit it to implement your own hooks (make targets) into
# the project as automated steps to be executed on locally and in the CD pipeline.

include scripts/init.mk

# ==============================================================================

# Example CI/CD targets are: dependencies, build, publish, deploy, clean, etc.

DEVCONTAINER_DIR ?= src/jekyll-devcontainer
DEVCONTAINER_IMAGE ?= ghcr.io/nhsdigital/nhs-notify-web-cms

dependencies: # Install dependencies needed to build and test the project @Pipeline
	# TODO: Implement installation of your project dependencies

build: # Build the project artefact @Pipeline
	if [[ "$${BUILD_TARGET:-all}" != "devcontainer" ]]; then \
		(cd docs && make build); \
	fi
	make build-devcontainer

publish: # Publish the project artefact @Pipeline
	make publish-devcontainer

build-devcontainer: # Build the devcontainer image @Pipeline
	make -C ${DEVCONTAINER_DIR} build IMAGE=${DEVCONTAINER_IMAGE}

publish-devcontainer: # Publish the devcontainer image @Pipeline
	make -C ${DEVCONTAINER_DIR} publish IMAGE=${DEVCONTAINER_IMAGE}

deploy: # Deploy the project artefact to the target environment @Pipeline
	# TODO: Implement the artefact deployment step

clean:: # Clean-up project resources (main) @Operations
	rm -f .version
	# TODO: Implement project resources clean-up step

config:: _install-dependencies version # Configure development environment (main) @Configuration
	(cd docs && make install)

version:
	rm -f .version
	make version-create-effective-file dir=.
	echo "{ \"schemaVersion\": 1, \"label\": \"version\", \"message\": \"$$(head -n 1 .version 2> /dev/null || echo unknown)\", \"color\": \"orange\" }" > version.json
# ==============================================================================

${VERBOSE}.SILENT: \
	build \
	build-devcontainer \
	clean \
	config \
	dependencies \
	deploy \
	publish \
	publish-devcontainer \
