#!/usr/bin/env bash

cmd_exists() {
    [ -x "$(command -v "$1")" ] \
        && printf 0 \
        || printf 1
}

show_msg() {
    echo "#########################################################################"
    echo " - $1"
    echo "#########################################################################"
}

# Ask for the administrator password upfront
clear
sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Copy dotfiles to ~
show_msg 'Copy all .dotfiles to `~`'

cp -r dotfiles/ ~

# Install things
source scripts/brew.sh
source scripts/cask.sh
source scripts/npm.sh

# Change to bash 4 (installed by homebrew)
show_msg 'Update PATH and Shells'
BASHPATH=$(brew --prefix)/bin/bash
sudo -s 'echo $BASHPATH >> /etc/shells'
chsh -s $BASHPATH # will set for current user only.

# Symlinkin gsha256sum (installed by homebrew)
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Apply OSX custom settings
show_msg 'Customizing OSX'
source scripts/osx.sh

# Load new shell
exec $SHELL -l
