FROM mcr.microsoft.com/devcontainers/jekyll:2-bullseye

# Add dependencies required for pa11y-ci to execute inside of the devcontainer.
RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends xorg openbox libnss3 libasound2 libatk-adaptor libgtk-3-0
