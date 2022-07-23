#!/bin/bash

mode="";
color="";

if [ "$EUID" -ne 0 ]
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

if ! [ -f "./$mode/$color.jpg" ]
then
    echo "Wallpaper \"$color\" not found"
    exit 1
fi

cp -r ./$mode/$color.jpg /usr/share/sddm/themes/Win11OS-$mode/background.jpg