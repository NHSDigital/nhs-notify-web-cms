# This file is for you! Edit it to implement your own Docker make targets.

# ==============================================================================
# NHS Notify Container Support (ECR with container name prefix)

docker-build: # Build container image - required: DOCKER_IMAGE, base_image=[base image]; optional: dir=[container directory] @Development
	source scripts/docker/docker.lib.sh; \
	dir=$(or ${dir}, .); \
	BASE_IMAGE="${base_image}" \
	DOCKER_IMAGE="$${DOCKER_IMAGE}" \
	dir="$${dir}" \
		docker-build-container

docker-push: # Push container image to registry - required: DOCKER_IMAGE @Development
	source scripts/docker/docker.lib.sh; \
	DOCKER_IMAGE="$${DOCKER_IMAGE}" \
		docker-push-container

docker-build-and-push: # Build and push container in one workflow - required: base_image=[base image]; optional: dir=[container directory], ecr_repo=[ECR repo name], container_name=[container name] @Development
	@dir=$(or ${dir}, .); \
	export DOCKER_IMAGE=$$(source scripts/docker/docker.lib.sh && \
		CONTAINER_IMAGE_PREFIX="$${CONTAINER_IMAGE_PREFIX}" \
		CONTAINER_IMAGE_SUFFIX="$${CONTAINER_IMAGE_SUFFIX:-}" \
		AWS_ACCOUNT_ID="$${AWS_ACCOUNT_ID}" \
		AWS_REGION="$${AWS_REGION}" \
		ECR_REPO="$${ECR_REPO:-${ecr_repo}}" \
		CONTAINER_NAME="$${CONTAINER_NAME:-${container_name}}" \
		dir="$${dir}" \
		docker-calculate-image-name); \
	echo "Building and pushing: $${DOCKER_IMAGE}"; \
	${MAKE} docker-ecr-login; \
	${MAKE} docker-build base_image=${base_image} dir="$${dir}" DOCKER_IMAGE="$${DOCKER_IMAGE}"; \
	${MAKE} docker-push DOCKER_IMAGE="$${DOCKER_IMAGE}"

docker-ecr-login: # Authenticate Docker with AWS ECR - required: AWS_ACCOUNT_ID, AWS_REGION @Development
	source scripts/docker/docker.lib.sh; \
	AWS_ACCOUNT_ID="$${AWS_ACCOUNT_ID}" \
	AWS_REGION="$${AWS_REGION}" \
		docker-ecr-login

docker-ghcr-login: # Authenticate Docker with GitHub Container Registry - required: GITHUB_TOKEN @Development
	source scripts/docker/docker.lib.sh; \
	GITHUB_TOKEN="$${GITHUB_TOKEN}" \
		docker-ghcr-login

clean:: # Remove container image and resources - required: DOCKER_IMAGE @Development
	source scripts/docker/docker.lib.sh; \
	DOCKER_IMAGE="$${DOCKER_IMAGE:-}" \
		docker-clean

# ==============================================================================
# Quality checks - please DO NOT edit this section!

docker-shellscript-lint: # Lint all Docker module shell scripts @Quality
	for file in $$(find scripts/docker -type f -name "*.sh"); do
		file=$${file} scripts/shellscript-linter.sh
	done

# ==============================================================================

${VERBOSE}.SILENT: \
	clean \
	docker-build \
	docker-build-and-push \
	docker-ecr-login \
	docker-ghcr-login \
	docker-push \
	docker-shellscript-lint \
