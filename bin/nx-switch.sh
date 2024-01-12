#!/usr/bin/env bash
set -e
cd ~/.config/Mothership/config
sudo nixos-rebuild switch --flake .#desktop --impure
