#!/usr/bin/env bash

function publish-desktop-entry() {

    local binary=`whereis $1 | rg -o '/nix/store/[^\s]+' | cat | sed -n '1p'`
    local folder=`dirname $binary`
    local folder=`dirname $folder`
    local filename=${2:-$1}
    ln -s $folder/share/applications/$filename.desktop $HOME/.local/share/applications/$filename.desktop

}

find  ~/.local/share/applications/ -name '*.desktop' -type l -exec rm {} \;
publish-desktop-entry firefox
publish-desktop-entry google-chrome-stable google-chrome
publish-desktop-entry spotify
publish-desktop-entry discord
publish-desktop-entry element-desktop
publish-desktop-entry thunderbird
publish-desktop-entry signal-desktop
publish-desktop-entry obsidian
publish-desktop-entry code


