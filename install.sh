# Symlink config paths to config files in this repository.
# Update configs with git pull, install only needed once.
#
# usage: ./install CONFIG_DIR

[ -z "$1" ] && exit 1

config_dir="$1"
configs="$(find "$config_dir" -type f)"

for config in $configs; do
    # set paths
    target="$(pwd)/$config"
    link="$HOME/${config#$config_dir}" # remove config dir prefix

    # make sure directory for link exists
    linkdir="$(dirname $link)"
    [ ! -d "$linkdir" ] && mkdir -p "$linkdir"

    # write symlink
    rm -f "$link"
    ln -s "$target" "$link"
done
