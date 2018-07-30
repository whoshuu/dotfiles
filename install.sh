#!/usr/bin/env bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

mkdir -p ~/.config
mkdir -p ~/.ssh
ln -sf ${DIR}/.vimrc ~/.vimrc
ln -sf ~/.vimrc ~/.config/nvim/init.vim
ln -sf ${DIR}/.zshrc ~/.zshrc
ln -sf ${DIR}/.dircolors.256dark ~/.dircolors.256dark
ln -sf ${DIR}/.Xresources ~/.Xresources
ln -sf ${DIR}/.aliases.default ~/.aliases.default
ln -sf ${DIR}/.exports.default ~/.exports.default
ln -sf ${DIR}/.gitconfig ~/.gitconfig
ln -sfn ${DIR}/.fonts ~/.fonts
ln -sf ${DIR}/.tmux.conf ~/.tmux.conf
ln -sfn ${DIR}/.urxvt ~/.urxvt
ln -sfn ${DIR}/.config/compton ~/.config/compton
ln -sfn ${DIR}/.config/polybar ~/.config/polybar
ln -sfn ${DIR}/.config/i3 ~/.config/i3
ln -sfn ${DIR}/.config/misc ~/.config/misc
ln -sf ${DIR}/.ssh/config ~/.ssh/config
rm -rf ~/.fzf*
ln -sfn ${DIR}/.fzf ~/.fzf
~/.fzf/install --bin
ln -sf ${DIR}/.fzf.version ~/.fzf.version
ln -sf ${DIR}/.fzf.bash ~/.fzf.bash
ln -sf ${DIR}/.fzf.zsh ~/.fzf.zsh
