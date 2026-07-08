# This file is for you! Edit it to implement your own hooks (make targets) into
# the project as automated steps to be executed on locally and in the CD pipeline.

include scripts/init.mk

# ==============================================================================

# Example CI/CD targets are: dependencies, build, publish, deploy, clean, etc.

DEVCONTAINER_DIR ?= src/jekyll-devcontainer
DEVCONTAINER_IMAGE ?= ghcr.io/nhsdigital/nhs-notify-web-cms-jekyll-devcontainer
DEVCONTAINER_TITLE ?= NHS Notify Web CMS Jekyll devcontainer

dependencies: # Install dependencies needed to build and test the project @Pipeline
	# TODO: Implement installation of your project dependencies

build: # Build the project artefact @Pipeline
	if [[ "$${BUILD_TARGET:-all}" == "devcontainer" ]]; then
		make build-devcontainer
	else
		(cd docs && make build)
		make build-devcontainer
	fi

publish: # Publish the project artefact @Pipeline
	if [[ "$${BUILD_TARGET:-all}" == "devcontainer" ]]; then
		make publish-devcontainer
	else
		make publish-devcontainer
	fi

build-devcontainer: # Build the devcontainer image @Pipeline
	make docker-build \
		dir=${DEVCONTAINER_DIR} \
		DOCKER_IMAGE=${DEVCONTAINER_IMAGE} \
		DOCKER_TITLE="${DEVCONTAINER_TITLE}"

publish-devcontainer: # Publish the devcontainer image @Pipeline
	make docker-push \
		dir=${DEVCONTAINER_DIR} \
		DOCKER_IMAGE=${DEVCONTAINER_IMAGE} \
		DOCKER_TITLE="${DEVCONTAINER_TITLE}"

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
