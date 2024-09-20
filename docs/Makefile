BASE_URL ?= ""
VERSION ?= ""
SHELL = /bin/bash

default: install

h help:
	@egrep '^\S|^$$' Makefile

include-npm-deps:
	@cp node_modules/nhsuk-frontend/dist/nhsuk.min.js assets/js/nhsuk.min.js

config: install

install:
	bundle config set --local path vendor/bundle
	bundle install
	npm install
	make include-npm-deps

s serve:
	bundle exec jekyll serve --trace --livereload

define baseurlparam =
$(if $(BASE_URL),-- --baseurl $(BASE_URL),-- --baseurl "")
endef

build: version
	npm run build $(baseurlparam)

debug: version
	npm run debug

version:
	touch _config.version.yml
	if [[ $(VERSION) == "" ]]; then \
		(cd .. && make version); \
		ver=$$(head -n 1 ../.version 2> /dev/null || echo unknown); \
		echo "version: $$ver" > _config.version.yml; \
		echo "$$ver" > .version; \
	else \
		echo "version: $(VERSION)" > _config.version.yml; \
		echo "$(VERSION)" > .version; \
	fi

	echo "{ \"schemaVersion\": 1, \"label\": \"version\", \"message\": \"$$(head -n 1 .version 2> /dev/null || echo unknown)\", \"color\": \"orange\" }" > version.json
