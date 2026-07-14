#!/bin/bash

cp ./postcreatecommand.sh /postcreatecommand.sh

cp ~/.zshrc /.zshrc
if [[ ! -d /.asdf ]]; then
    git clone https://github.com/asdf-vm/asdf.git /.asdf --branch v0.18.0
fi

# Remove any existing home-based asdf init lines to avoid switching to /home/vscode/.asdf.
sed -i "/\. '\$HOME\/.asdf\/completions\/asdf.bash'/d" /.zshrc
sed -i '/\. \/\.asdf\/completions\/asdf.bash/d' /.zshrc

grep -qxF 'export ASDF_DIR=/.asdf' /.zshrc || echo 'export ASDF_DIR=/.asdf' >> /.zshrc
grep -qxF 'export ASDF_DATA_DIR=/.asdf' /.zshrc || echo 'export ASDF_DATA_DIR=/.asdf' >> /.zshrc
grep -qxF 'export PATH=/.asdf/bin:/.asdf/shims:$PATH' /.zshrc || echo 'export PATH=/.asdf/bin:/.asdf/shims:$PATH' >> /.zshrc
sed -i "/plugins=/c\plugins=(git ssh-agent sudo terraform dirhistory zsh-autosuggestions)" /.zshrc

cat /.zshrc

cp /.zshrc ~/.zshrc
# shellcheck disable=SC1090
source ~/.zshrc
mkdir -p /zsh/plugins/zsh-autosuggestions
if [[ ! -d /zsh/plugins/zsh-autosuggestions/.git ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions /zsh/plugins/zsh-autosuggestions
fi
