#! /bin/bash
if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v vim)" ]; then
  echo 'Error: vim is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v python3)" ]; then
  echo 'Error: python3 is not installed.' >&2
  exit 1
fi

if ! [ -x "$(command -v cmake)" ]; then
  echo 'Error: cmake is not installed.' >&2
  exit 1
fi


echo "Creating required directories..."
mkdir $HOME/.vim
mkdir $HOME/.vim/swap
echo "Done creating directories"

echo "Installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

echo "Installing Vundle Plugins..."
vim +PluginInstall +qall

echo "Configuring YouCompleteMe!"
python3 $HOME/.vim/bundle/YouCompleteMe/install.py --all
