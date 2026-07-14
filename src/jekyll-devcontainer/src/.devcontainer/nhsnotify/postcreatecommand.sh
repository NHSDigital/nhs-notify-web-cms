#!/bin/bash

cp /.zshrc ~/.zshrc
cp -r /zsh/* ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
ls -la ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

cat ~/.zshrc
source ~/.zshrc

export ASDF_DIR=/.asdf
export ASDF_DATA_DIR=/.asdf
export PATH="$ASDF_DIR/shims:$ASDF_DIR/bin:$PATH"
ASDF_BIN="$ASDF_DIR/bin/asdf"

# Install tools pinned in .tool-versions so runtime versions are consistent.
$ASDF_BIN install
$ASDF_BIN reshim
hash -r # Rehash shims so that the new versions are used

echo 'asdf setup complete'
make config
echo 'make config complete'

jekyll --version && cd docs && bundle install
echo 'jekyll setup complete'
