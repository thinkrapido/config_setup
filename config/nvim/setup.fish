#!/nix/store/kbbr7asvg8bf3s0k3vkkw2s3c27fki47-fish-3.5.1/bin/fish

set path ~/.local/share/nvim/site/pack/packer/start/packer.nvim

if [ ! -f $path ]
    git clone --depth 1 https://github.com/wbthomason/packer.nvim $path
end
