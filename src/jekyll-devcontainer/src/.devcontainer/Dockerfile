FROM --platform=linux/amd64 mcr.microsoft.com/devcontainers/jekyll:3.4-bookworm
LABEL org.opencontainers.image.source=https://github.com/NHSDigital/nhs-notify-web-cms

COPY packages.txt packages.txt
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive xargs apt-get -yq install < packages.txt
