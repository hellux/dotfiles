# Symlink config paths to config files in this repository.
# Update configs with git pull, install only needed once.
#
# usage: ./install CONFIG_DIR
# CONFIG_DIR in {laptop, desktop, common}

config_dir=$1

[ -z $config_dir ] && exit 1

configs=$(find $config_dir -type f)

for config in $configs; do
    # set paths
    target=$(pwd)/$config
    link=$HOME/${config#$config_dir} # remove config dir prefix

    # make sure directory for link exists
    linkdir=$(dirname $link)
    [ ! -d $linkdir ] && mkdir -p $linkdir

    # write symlink
    rm $link 2> /dev/null
    ln -s $target $link
done
