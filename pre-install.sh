#!/usr/bin/env bash

### Table of contents ###
#                       #
#  [MSC] Misc           #
#  [ZSH] Zsh            #
#  [URX] Urxvt          #
#  [PYT] Python         #
#  [VIM] Neovim         #
#  [HUB] Hub            #
#  [DCK] Docker         #
#  [CHR] Chrome         #
#  [SPT] Spotify        #
#                       #
#  ######################

## [MSC] Misc ##
sudo apt update
sudo apt install -y tmux git curl gpg python-software-properties

## [ZSH] Zsh ##
sudo apt update
sudo apt install -y zsh
# $ chsh -s `which zsh`
# logout/login

## [URX] Urxvt ##
sudo apt update
sudo apt install -y rxvt-unicode-256color

## [PYT] Python ##
sudo apt update
sudo apt install -y python3

## [VIM] Neovim ##
sudo apt update
sudo apt install -y python3-neovim

## [HUB] Hub ##
sudo add-apt-repository ppa:cpick/hub
sudo apt update
sudo apt install -y hub

## [DCK] Docker ##
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable'
sudo apt update
sudo apt install -y docker-ce
sudo usermod -aG docker ${USER}
# logout/login

## [CHR] Chrome ##
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install -y google-chrome-stable

## [SPT] Spotify ##
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo 'deb http://repository.spotify.com stable non-free' | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install -y spotify-client
