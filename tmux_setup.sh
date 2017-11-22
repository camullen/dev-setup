#!/bin/bash

set -eaux

ret_dir=$(pwd)
cd "${BASH_SOURCE%/*}" || exit

sudo apt-get install -y xsel xdg-utils
TPM_DIRECTORY=~/.tmux/plugins/tpm

if [ ! -d "$TPM_DIRECTORY" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  # Clone TPM into correct location
  git clone https://github.com/tmux-plugins/tpm $TPM_DIRECTORY
fi

# Copy tmux.conf
cp ./tmux-src.conf ~/.tmux.conf

# Start tmux-session manually for proper operation
tmux -c 'echo "tmux running"' -f ~/.tmux.conf



# Install plugins
~/.tmux/plugins/tpm/bin/install_plugins


cd $ret_dir
