FROM --platform=linux/amd64 mcr.microsoft.com/devcontainers/jekyll:3.4-bookworm
LABEL org.opencontainers.image.source=https://github.com/NHSDigital/nhs-notify-web-cms

ENV ASDF_DIR=/.asdf
ENV PATH=${ASDF_DIR}/bin:${ASDF_DIR}/shims:${PATH}

COPY packages.txt packages.txt
COPY .tool-versions .tool-versions

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive xargs apt-get -yq install < packages.txt

RUN git clone https://github.com/asdf-vm/asdf.git ${ASDF_DIR} --branch v0.18.0 \
	&& . ${ASDF_DIR}/asdf.sh \
	&& awk '/^[a-zA-Z0-9_-]+[[:space:]]+/{print $1}' .tool-versions | while read -r plugin; do asdf plugin add "$plugin" || true; done \
	&& asdf install \
	&& asdf reshim \
	&& rm -f .tool-versions
