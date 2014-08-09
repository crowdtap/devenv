#!/bin/bash
#
# Installation for the Crowdtap Dev Environment
#

if [ `uname -s` != "Darwin" ]; then
  echo "Unable to automate unless I am on OSX."
  exit 0
fi

DEST=$HOME/.devenv
if [ -d "$DEST" ]; then
  echo "You seem to have installed dotenv already."
  exit 0
fi

echo "Installing Homebrew..."
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew install caskroom/cask/brew-cask

echo "Installing VirtualBox..."
brew cask install virtualbox

echo "Installing Vagrant..."
brew cask install vagrant

echo "Installing devenv CLI..."
git clone git@github.com:crowdtap/devenv.git $DEST
sudo ln -sf $DEST/.devenv/bin/devenv.sh /usr/local/devenv
