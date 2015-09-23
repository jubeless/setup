#!/bin/bash
# Simple setup.sh for configuring Ubuntu instance
# for headless setup.

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git
sudo apt-get install -y curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# git pull and install dotfiles as well
cd $HOME
NOW=$(date +"%m-%d-%Y-%H-%M")
FOLDER="configs.backup.$NOW"
mkdir "$FOLDER"

if [ -d ./dotfiles/ ]; then
  mv .bash_profile "$FOLDER/"
fi

if [ -d .emacs.d/ ]; then
    mv .emacs.d "$FOLDER/"
fi

if [ -f .bashrc ]; then
  mv .bashrc "$FOLDER/"
fi

if [ -f .bash_profile ]; then
  mv .bash_profile "$FOLDER/"
fi

if [ -f .bashrc_custom ]; then
  mv .bashrc_custom "$FOLDER/"
fi
git clone https://github.com/juliencassis/dotfiles
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .
