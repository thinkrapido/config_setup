#!/usr/bin/env fish

set config_folder  ~/.config/
set archive_folder ~/Mothership/config/setup/dotconfig

function setup

    set folder (basename $argv[1])
    echo setting up folder [$folder]

	rm -rf $config_folder/$folder 2> /dev/null
    ln -s $archive_folder/$folder $config_folder/$folder

    if [ -e $config_folder/$folder/setup.fish ]
        $config_folder/$folder/setup.fish
    end
end

function delete_broken_links
    find $argv[1] -xtype l -delete
end

function create_links

    rm $archive_folder/*
    set folders (rg dotconfigs config/dotconfig-folders.nix | sed 's$.*\.\./$$g')
    rm -rf setup/dotconfig 2> /dev/null
    mkdir -p setup/dotconfig
    for f in $folders
        for ff in (dir -1 "$f")
            set file $f/$ff
            ln -s ../../$file $archive_folder
        end
    end

end

create_links

for f in (find $archive_folder -maxdepth 1 -type l | sed '1 d; /.git/ d')
    setup $f
end

delete_broken_links ~/.config/
