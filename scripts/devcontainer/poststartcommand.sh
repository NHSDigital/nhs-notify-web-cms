#!/bin/bash
cd $CODESPACE_VSCODE_FOLDER
make config
jekyll --version && cd docs && bundle install
