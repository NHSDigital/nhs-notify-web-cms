#!/bin/bash

cp /.zshrc ~/.zshrc
cp -r /zsh/* ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
ls -la ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

cat ~/.zshrc
source ~/.zshrc

repo_root="$(git rev-parse --show-toplevel 2> /dev/null || pwd)"
cd "$repo_root" || exit 1

pre-commit install \
    --config scripts/config/pre-commit.yaml \
    --install-hooks

cd docs || exit 1
bundle config set --local path vendor/bundle
bundle install
npm install
make include-npm-deps

echo 'post-create setup complete'
