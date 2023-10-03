#!/usr/bin/env fish

set config_folder  ~/.config/
set archive_folder ~/Mothership/config/dotconfigs/combo-$argv[1]

find $config_folder -xtype l -delete
for f in (find $archive_folder -maxdepth 1 -type l | sed '1 d; /.git/ d')
    rm -rf $config_folder/(basename $f) 2> /dev/null
    ln -s $f $config_folder
    echo (basename $f) config linked
end

