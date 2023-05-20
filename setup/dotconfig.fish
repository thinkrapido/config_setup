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

for f in (find $archive_folder -maxdepth 1 -type l | sed '1 d; /.git/ d')
    setup $f
end

