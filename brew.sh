#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install other useful binaries.
brew install ack
brew install git
brew install tree
brew install git-crypt
brew install pyenv
brew install nvm

# Install GUI apps too via `cask`
brew tap caskroom/cask
brew cask install --require-sha sublime-text cheatsheet lockdown google-drive google-hangouts slack

# Remove outdated versions from the cellar.
brew cleanup
