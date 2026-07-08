FROM mcr.microsoft.com/devcontainers/ruby:3.3-bookworm

ARG DEBIAN_FRONTEND=noninteractive

# Install Node.js for frontend tooling used by docs build scripts.
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl gnupg make \
    && mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends nodejs \
    && npm install -g npm@latest \
    && gem install bundler:2.5.10 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspaces/nhs-notify-web-cms
