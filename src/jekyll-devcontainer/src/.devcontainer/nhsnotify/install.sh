#!/bin/bash

cp ./postcreatecommand.sh /postcreatecommand.sh

cp ~/.zshrc /.zshrc
sed -i "/plugins=/c\plugins=(git ssh-agent sudo terraform dirhistory zsh-autosuggestions)" /.zshrc

cat /.zshrc

cp /.zshrc ~/.zshrc
# shellcheck disable=SC1090
source ~/.zshrc
mkdir -p /zsh/plugins/zsh-autosuggestions
if [[ ! -d /zsh/plugins/zsh-autosuggestions/.git ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions /zsh/plugins/zsh-autosuggestions
fi
