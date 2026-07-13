IMAGE ?= ghcr.io/nhsdigital/nhs-notify-web-cms

build:
	$(MAKE) -C ../../ version
	ver=$$(head -n 1 ../../.version 2> /dev/null || echo unknown); \
	verb=$$(echo $$ver | sed 's/+.*//'); \
	echo "version: $$verb"; \
	BUILDKIT_PROGRESS=plain npx --yes @devcontainers/cli build --workspace-folder ./src --image-name "${IMAGE}:$$verb"

publish:
	ver=$$(head -n 1 ../../.version 2> /dev/null || echo unknown); \
	verb=$$(echo $$ver | sed 's/+.*//'); \
	echo "version: $$verb"; \
	docker image tag ${IMAGE}:$$verb ${IMAGE}:latest; \
	docker push "${IMAGE}:$$verb"; \
	docker push "${IMAGE}:latest"

debug:
	npx --yes @devcontainers/cli up --workspace-folder ./src
	npx --yes @devcontainers/cli exec --workspace-folder ./src ls -la ./.devcontainer
	npx --yes @devcontainers/cli exec --workspace-folder ./src cat ./.devcontainer/packages.txt
	npx --yes @devcontainers/cli exec --workspace-folder ./src ./.devcontainer/check.sh
