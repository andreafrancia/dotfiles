#!/bin/bash

cd "$(dirname "$0")"

git pull

ln -sfT $PWD/ackrc ~/.ackrc
ln -sfT $PWD/gitconfig ~/.gitconfig

[[ ! -h ~/.bin ]] && rm -rf ~/.bin
ln -sfT $PWD/bin ~/.bin

mkdir -p ~/.fonts
for font in `ls $PWD/fonts`; do
  ln -sfT $PWD/fonts/$font ~/.fonts/$font
done
fc-cache -fv ~/.fonts

[[ ! -h ~/.i3 ]] && rm -rf ~/.i3
ln -sfT $PWD/i3 ~/.i3

ln -sfT $PWD/dunstrc ~/.dunstrc
ln -sfT $PWD/gtkrc-2.0 ~/.gtkrc-2.0

ln -sfT $PWD/xinitrc ~/.xinitrc
ln -sfT $PWD/xinitrc ~/.xsession
ln -sfT $PWD/xinitrc ~/.xprofile
ln -sfT $PWD/xdefaults ~/.xdefaults
ln -sfT $PWD/xmodmap ~/.xmodmap

[[ ! -h ~/.vim ]] && rm -rf ~/.vim
ln -sfT $PWD/vim ~/.vim
ln -sfT $PWD/vimrc ~/.vimrc
if [ ! -d ~/.vim/bundle/vundle ]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
vim +BundleInstall! +qall > /dev/null 2>&1

if [ ! -d ~/.oh-my-zsh ]; then
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

for file in `ls $PWD/zsh`; do
  ln -sfT $PWD/zsh/$file ~/.oh-my-zsh/custom/$file
done

ln -sfT $PWD/zshrc ~/.zshrc
export ZSH=~/.oh-my-zsh
if which zsh > /dev/null; then
  zsh ~/.zshrc
  zsh $ZSH/tools/upgrade.sh
fi
