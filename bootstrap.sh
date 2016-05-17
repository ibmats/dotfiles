#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `bootstrap.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Create my directories

mkdir -p ~/{Projects/{JavaScript,Python/{Virtualenvs},Ruby,Swift,},Screenshots}

# Install rbenv

brew update
brew install rbenv
brew install ruby-build

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile #to enable shims and auto-complete

# Install virtualenv

pip install virtualenv

echo ‘export PIP_REQUIRE_VIRTUALENV=true’ ~/.bash_profile

# Source .bash_profile

source .bash_profile