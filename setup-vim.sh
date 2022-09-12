#! /bin/bash
if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  exit 1
fi

echo "Creating required directories..."
mkdir $HOME/.vim
mkdir $HOME/.vim/swap
echo "Done creating directories"

echo "Installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
