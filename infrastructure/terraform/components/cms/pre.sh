#!/bin/bash

# This script is run before Terraform executable commands.
# It ensures all Node.js dependencies are installed, generates any required dependencies,
# and builds all Lambda functions in the workspace before Terraform provisions infrastructure.
# pre.sh runs in the same shell as terraform.sh, not in a subshell

: "${PROJECT:?PROJECT is required}"
: "${REGION:?REGION is required}"
: "${COMPONENT:?COMPONENT is required}"
: "${ENVIRONMENT:?ENVIRONMENT is required}"
: "${AWS_ACCOUNT_ID:?AWS_ACCOUNT_ID is required}"
: "${ACTION:?ACTION is required}"

echo "Running app pre.sh"
echo "ENVIRONMENT=$ENVIRONMENT"
echo "ACTION=$ACTION"
echo "PROJECT=$PROJECT"
echo "COMPONENT=$COMPONENT"
echo "AWS_REGION=$REGION"
echo "AWS_ACCOUNT_ID=$AWS_ACCOUNT_ID"

# Calculate container image prefix from PROJECT, ENVIRONMENT, COMPONENT
CONTAINER_IMAGE_PREFIX="${PROJECT}-${ENVIRONMENT}-${COMPONENT}"
echo "CONTAINER_IMAGE_PREFIX: ${CONTAINER_IMAGE_PREFIX}"

# Translate ACTION to PUBLISH_CONTAINER_IMAGE (build)
if [ "${ACTION}" = "plan" ]; then
  PUBLISH_CONTAINER_IMAGE="false"
else
  PUBLISH_CONTAINER_IMAGE="true"
fi

# Helper function for error handling
run_or_fail() {
  "$@"
  if [ $? -ne 0 ]; then
    echo "$* failed!" >&2
    exit 1
  fi
}

# Switch to repo root
pushd "$(git rev-parse --show-toplevel)" || exit 1

# Calculate git-based version suffix
SHORT_SHA="$(git rev-parse --short HEAD)"
GIT_TAG="$(git describe --tags --exact-match 2>/dev/null || true)"

if [ -n "${GIT_TAG}" ]; then
  RELEASE_VERSION="${GIT_TAG#v}"
  CONTAINER_IMAGE_SUFFIX="release-${RELEASE_VERSION}-${SHORT_SHA}"
  echo "On tag: $GIT_TAG, image suffix: ${CONTAINER_IMAGE_SUFFIX}"
else
  CONTAINER_IMAGE_SUFFIX="sha-${SHORT_SHA}"
  echo "Not on a tag, image suffix: ${CONTAINER_IMAGE_SUFFIX}"
fi

# Export for Terraform
export TF_VAR_container_image_tag_suffix="${CONTAINER_IMAGE_SUFFIX}"
export ECR_REPO="${PROJECT}-main-acct-web-cms-test" # TODO

run_or_fail npm ci
run_or_fail npm run generate-dependencies --workspaces --if-present
# run_or_fail npm run build:archive --workspaces --if-present
run_or_fail env \
  CONTAINER_IMAGE_PREFIX="${CONTAINER_IMAGE_PREFIX}" \
  CONTAINER_IMAGE_SUFFIX="${CONTAINER_IMAGE_SUFFIX}" \
  AWS_ACCOUNT_ID="${AWS_ACCOUNT_ID}" \
  AWS_REGION="${REGION}" \
  PUBLISH_CONTAINER_IMAGE="${PUBLISH_CONTAINER_IMAGE}" \
  npm run build:container --workspaces --if-present

popd || exit 1 # Return to working directory
