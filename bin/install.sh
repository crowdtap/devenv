#!/bin/bash
#
# Installation for the Crowdtap Dev Environment
#

DEST=$HOME/.devenv
if [ -d "$DEST" ]; then
  echo "You seem to have installed dotenv already."
  exit 0
fi


if [ `uname -s` = "Darwin" ]; then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  brew install caskroom/cask/brew-cask

  echo "Installing VirtualBox..."
  brew cask install virtualbox

  echo "Installing Vagrant..."
  brew cask install vagrant
elif [ `lsb_release -si` = "Ubuntu" ]; then
  echo "Installing VirtualBox..."
  sudo sh -c "echo 'deb http://download.virtualbox.org/virtualbox/debian '$(lsb_release -cs)' contrib non-free' > /etc/apt/sources.list.d/virtualbox.list" && \
  wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add - && \
  sudo apt-get update && sudo apt-get install virtualbox-4.3 dkms

  echo "Installing Vagrant..."
  cd /tmp && wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.3_x86_64.deb
  sudo dpkg -iy vagrant_1.6.3_x86_64.deb
else
  echo "Unable to automate, not on OSX or Linux."
  exit 1
fi

echo "Installing devenv CLI..."
git clone git@github.com:crowdtap/devenv.git $DEST
sudo ln -sf $DEST/.devenv/bin/devenv.sh /usr/local/devenv
