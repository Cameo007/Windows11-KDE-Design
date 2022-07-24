#!/bin/bash

SRC_DIR=$(cd $(dirname $0) && pwd)

mode="";
color="";

if [ "$UID" != 0 ]
then
  exec sudo "$0" "$@"
fi

while getopts m:c: flag
do
    case "${flag}" in
        m) mode="$OPTARG";;
        c) color="$OPTARG";;
    esac
done

if [ "$mode" != "light" ] && [ "$mode" != "dark" ]
then
    echo "Please specify the mode (light/dark)"
    exit 1
fi

if ! [ -f "$SRC_DIR/$mode/$color.jpg" ]
then
    echo "Wallpaper \"$color\" not found"
    exit 1
fi

cp -r $SRC_DIR/$mode/$color.jpg /usr/share/sddm/themes/Win11OS-$mode/background.jpg
