#! /usr/bin/env bash

# Simple setup.sh for configuring MAC
# for headless setup.

cd $HOME

#create backup file
NOW=$(date +"%m-%d-%Y-%H-%M")
FOLDER="configs.backup.$NOW"
mkdir "$FOLDER"

if [ -f .bash_profile ]; then
  mv .bash_profile "$FOLDER/"
fi

if [ -f .bashrc ]; then
  mv .bashrc "$FOLDER/"
fi

if [ -f .bashrc_custom ]; then
  mv .bashrc_custom "$FOLDER/"
fi

# git pull and install dotfiles as well

if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi

git clone https://github.com/juliencassis/dotfiles

#ln -s dotfiles/.bash_profile .
#ln -s dotfiles/.bashrc .
#ln -s dotfiles/.bashrc_custom .

#TO DO: Did not test these comamnds... Iknow it works with the one above
cp dotfiles/.bash_profile .
cp dotfiles/.bashrc .
cp dotfiles/.bashrc_custom .
