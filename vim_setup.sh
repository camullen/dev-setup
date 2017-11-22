#!/bin/bash

set -eaux

ret_dir=$(pwd)
cd "${BASH_SOURCE%/*}" || exit

VUNDLE_DIRECTORY=~/.vim/bundle/Vundle.vim

if [ ! -d "$VUNDLE_DIRECTORY" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  # Clone Vundle into correct location
  git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_DIRECTORY
fi

# Copy vimrc
cat ./vimrc-src > ~/.vimrc

# Update plugins
# TODO: fix warnings on solarized color scheme
vim +silent! +PluginInstall +qall


# Install youcompleteme

# Install prerequisites
sudo apt-get install -y build-essential cmake python-dev python3-dev mono-xbuild
# TODO: check for older version (14.04) and install cmake3
cd ~/.vim/bundle/youcompleteme
./install.py --clang-completer --go-completer --js-completer --rust-completer

cd $ret_dir
