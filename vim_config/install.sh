#!/bin/bash

VundleVimRepository='https://github.com/VundleVim/Vundle.vim.git'
VundleDestDirInLinux='~/.vim'
VundleDestDirInWindows='~/vimfiles'
OS=$(uname -a)

echo '========>Clone VundleVim repository'
if [[ $OS == Linux* ]]; then
  rm -rf $VundleDestDirInLinux
  git clone $VundleVimRepository $VundleDestDirInLinux/bundle/Vundle.vim
else
  rm -rf $VundleDestDirInWindows
  git clone $VundleVimRepository $VundleDestDirInWindows/bundle/Vundle.vim
fi
echo '========================================'
echo ''

echo '========>Link vimrc file'
linkVimrcFile
echo '========================================'
echo ''

echo 'Enter vim and run command :PluginInstall'
vim
echo 'Done!'

linkVimrcFile() {
  rm ~/.vimrc
  ln -s $(pwd)/.vimrc ~/.vimrc
}
