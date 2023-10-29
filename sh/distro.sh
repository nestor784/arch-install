#!/bin/bash
dotfiles="$HOME/dotfiles"
git clone https://github.com/nestor784/dotfiles.git ${dotfiles}
if [-d "$HOME/.config/qtile"];then
	rm -rf .config/qtile/*
fi
cp ${HOME}/dotfiles/.config/qtile ${HOME}/.config/qtile
