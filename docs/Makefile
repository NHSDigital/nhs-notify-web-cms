default: install

h help:
	@egrep '^\S|^$$' Makefile

include-npm-deps:
	@cp node_modules/nhsuk-frontend/dist/nhsuk.min.js assets/js/nhsuk.min.js

install:
	bundle config set --local path vendor/bundle
	bundle install
	npm install
	make include-npm-deps

s serve:
	bundle exec jekyll serve --trace --livereload

build:
	JEKYLL_ENV=production bundle exec jekyll build --trace

debug:
	npm run debug
