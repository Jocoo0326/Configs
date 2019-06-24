#!/bin/sh

VundleVimRepository='https://github.com/VundleVim/Vundle.vim.git'
VundleDestDirInLinux=~/.vim
VundleDestDirInWindows=~/vimfiles
OS=$(uname -a)

echo '========>Clone VundleVim repository'
if [[ $OS == M* ]]; then
  if [ -d "${VundleDestDirInWindows}_backup" ]; then
    rm -rf "${VundleDestDirInWindows}_backup"
  fi
  if [ -d "$VundleDestDirInWindows" ]; then
    mv $VundleDestDirInWindows "${VundleDestDirInWindows}_backup"
  fi
  git clone --depth=1 $VundleVimRepository $VundleDestDirInWindows/bundle/Vundle.vim
  vimrc=_vimrc
else
  if [ -d "${VundleDestDirInLinux}_backup" ]; then
    rm -rf "${VundleDestDirInLinux}_backup"
  fi
  if [ -d "$VundleDestDirInLinux" ]; then
    mv $VundleDestDirInLinux "${VundleDestDirInLinux}_backup"
  fi
  git clone --depth=1 $VundleVimRepository $VundleDestDirInLinux/bundle/Vundle.vim
  vimrc=.vimrc
fi
echo '========================================'
echo ''

if [[ $OS == M* ]]; then
  echo 'Enter vim and run command :PluginInstall'
else
  echo 'Run :PluginInstall from terminal'
  vim +PluginInstall +qall
fi

echo 'Done!'
