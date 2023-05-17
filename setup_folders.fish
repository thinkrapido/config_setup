#!/usr/bin/env /nix/store/kbbr7asvg8bf3s0k3vkkw2s3c27fki47-fish-3.5.1/bin/fish

set config_folder  ~/.config/
set archive_folder ~/Mothership/config/

function setup

    set folder (basename $argv[1])
    echo setting up folder [$folder]

	rm -rf $config_folder/$folder 2> /dev/null
    ln -s $archive_folder/$folder $config_folder/$folder

    if [ -e $config_folder/$folder/setup.fish ]
        $config_folder/$folder/setup.fish
    end
end

for f in (find $archive_folder -maxdepth 1 -type d | sed '1 d; /.git/ d')
    setup $f
end

