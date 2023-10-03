#!/usr/bin/env bash

find ~/.local/share/applications/ -xtype l -delete
ln -sf ~/.nix-profile/share/applications/*.desktop ~/.local/share/applications/

