#!/usr/bin/env fish

set path ~/.local/share/nvim/site/pack/packer/start/packer.nvim

if [ ! -f $path ]
    git clone --depth 1 https://github.com/wbthomason/packer.nvim $path
end
