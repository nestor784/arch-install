#!/bin/bash
master=$(dirname $(dirname $(readlink -fm "$0")))
yay -S - < ${master}/etc/pkgneovim.txt
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

gem install neovim
npm install -g neovim

pyenv install 2.7.18
pyenv virtualenv 2.7.18 py2nvim
pyenv activate py2nvim
pip install pynvim
path1=$(which python)
pyenv deactivate

pyenv install 3.11.4
pyenv virtualenv 3.11.4 py3nvim
pyenv activate py3nvim
pip install pynvim
path2=$(which python)
pyenv deactivate


dotfiles="$HOME/dotfiles"
DIR_NVIM="$HOME/.config/nvim/"
# DOTFILES
if [ ! -d "$dotfiles" ];then
	git clone --depth=1 https://github.com/nestor784/dotfiles.git ${dotfiles}
fi
# NVIM
if [ -d "$DIR_NVIM" ];then
	rm -rf ${DIR_NVIM}
fi
cp -rf ${dotfiles}/.config/nvim/ ${DIR_NVIM}

sed -i "/g.python_host_prog =/ s/=/=$path1/" ${DIR_NVIM}/lua/settings.lua
sed -i "/g.python3_host_prog =/ s/=/=$path2/" ${DIR_NVIM}/lua/settings.lua

