#!/bin/bash
# dotfilesmgr - manage dotfiles repository
#
# This script parses config paths from a text file and
# iterates through them with selected operation
#
# usage: ./dotfilesmgr.sh <save|load|diff>
#
# save: copy files from home folder to repository
# load: copy files from repository to home folder
# diff: compare files in home folder to files in repository 
# git-add: add files to git repository
#
# script written by Hellux for personal use
# modification and redistribution permitted

CONFIG_LOCATIONS="paths.txt"
CONFIG_STORAGE="configs"
BACKUP="backup"

# colored print functions
function perr { echo -e "\e[0;31m$1\e[0m"; }
function psuc { echo -e "\e[0;34m$1\e[0m"; }

# copies $1 to $2
function copy {
    if [ -r $1 ]; then
        mkdir -p $(dirname $2)
        cp $1 $2
        if [ $? -eq 0 ]; then
            psuc "$1 copied to $2."
            copy_success=true
        else
            perr "Copying $1 to $2 failed."
            copy_success=false
        fi
    else
        perr "Can't read $1."
        copy_success=false
    fi
}

# runs diff and prints colored output if files differ
function diff_color {
    if [ -r $current -a -r $saved ]; then
        df=$(diff $current $saved)
        cat /dev/null # added because df won't get assigned without anything here
        if [ -n "$df" -a $? -eq 0 ]; then
            echo -e "\e[1;31m$current\e[0m <> \e[1;32m$saved\e[0m:"
            echo -e "$(diff $1 $2 | sed -e '/^</ s/</\\e[31m</;s/$/\\e[0m/' \
                                        -e '/^>/ s/>/\\e[32m>/;s/$/\\e[0m/')"
        fi
    else
        perr "Can't read $current and/or $saved."
    fi
}

# cd to dir of script
cd $(dirname ${BASH_SOURCE[0]})

# handle args
if [ -z "$1" ]; then
    echo -e "Select \e[1ms\e[0mave, \e[1ml\e[0moad, \e[1mg\e[0mit-add, \e[1md\e[0miff or \e[1mS\e[0mkip."
    option_all="c"
    lines=$(wc -l < "$CONFIG_LOCATIONS")
    current_line=1
elif [ "$1" = "save" -o "$1" = "load" -o "$1" = "diff" -o "$1" = "git-add" ]; then
    option_all=$1
else
    echo "usage: ./dotfilesmgr <save|load|diff|git-add>"
fi

# loop through config files
for config_path in $(cat $CONFIG_LOCATIONS); do
    current=$HOME/$config_path
    saved=$CONFIG_STORAGE/$config_path
    backup=$BACKUP/$config_path
    if [ "$option_all" = "c" ]; then
        read -p "$current_line/$lines $config_path: " option
        current_line=$((current_line + 1))
    else
        option=$option_all
    fi
    case $option in
        s|save )
            copy $current $saved;;
        l|load )
            copy $current $backup
            if [ copy_success=true ]; then
                copy $saved $current
            else
                perr "Failed to save backup to $backup, will not overwrite without backup."
            fi;;
        d|diff )
            diff_color $current $saved;;
        g|git-add )
            if [ -r $saved ]; then
                git add $saved
            else
                perr "Can't read $saved."
            fi;;
    esac
done
