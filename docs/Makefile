default: install

h help:
	@egrep '^\S|^$$' Makefile

install:
	bundle config set --local path vendor/bundle
	bundle install
	npm install
  rm node_modules/nhsuk-frontend/packages/core/vendor/sass-mq.scss
  cp ../src/sass-mq.scss node_modules/nhsuk-frontend/packages/core/vendor/sass-mq.scss

s serve:
	bundle exec jekyll serve --trace --livereload

build:
	JEKYLL_ENV=production bundle exec jekyll build --trace

debug:
	npm run debug
