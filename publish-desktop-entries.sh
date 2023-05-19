#!/usr/bin/env bash

function publish-desktop-entry() {

    local filename="hm-$1.desktop"
    [ -e ./desktop-entries/$filename ] || return
    local binary=`whereis $1 | rg -o '/nix/store/[^\s]+' | cat`
    local folder=`dirname $binary`
    local folder=`dirname $folder`
    sed -e '/^Exec=/ s$.*$Exec='$HOME'/.nix-profile/bin/'$1' %u$;/^Icon=/ s$.*$Icon='$folder'/share/icons/hicolor/256x256/apps/'$2'.png$' ./desktop-entries/$filename > $HOME/.local/share/applications/$filename
    chmod u+x $HOME/.local/share/applications/$filename

}

publish-desktop-entry firefox firefox
publish-desktop-entry google-chrome-stable google-chrome
publish-desktop-entry spotify spotify-client
publish-desktop-entry discord discord
publish-desktop-entry element-desktop element


