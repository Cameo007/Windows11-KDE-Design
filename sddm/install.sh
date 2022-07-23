#!/bin/bash

mode="";

if [ "$EUID" -ne 0 ]
then
  exec sudo "$0" "$@"
fi

while getopts m:c: flag
do
    case "${flag}" in
        m) mode="$OPTARG";;
    esac
done

if [ "$mode" == "light" ]
then
  ./light/install.sh
elif [ "$mode" == "dark" ]
then
  ./dark/install.sh
else
    echo "Please specify the mode (light/dark)"
fi

