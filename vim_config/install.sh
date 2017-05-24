#!/bin/sh

VundleVimRepository='https://github.com/VundleVim/Vundle.vim.git'
VundleDestDirInLinux=~/.vim
VundleDestDirInWindows=~/vimfiles
OS=$(uname -a)

echo '========>Clone VundleVim repository'
if [[ $OS == MS* ]]; then
  rm -rf $VundleDestDirInWindows
  git clone $VundleVimRepository $VundleDestDirInWindows/bundle/Vundle.vim
  vimrc=_vimrc
else
  rm -rf $VundleDestDirInLinux
  git clone $VundleVimRepository $VundleDestDirInLinux/bundle/Vundle.vim
  vimrc=.vimrc
fi
echo '========================================'
echo ''

echo '========>Link vimrc file'
rm ~/$vimrc
ln -s $(pwd)/.vimrc ~/$vimrc
echo '========================================'
echo ''

echo 'Enter vim and run command :PluginInstall'
vim
echo 'Done!'
