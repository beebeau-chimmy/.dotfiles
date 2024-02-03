#!/bin/env bash

source ~/.cache/wal/colors.sh

dunst_path=$HOME/.config/dunst/dunstrc

if [ -f $dunst_path ]; then
    rm -f $dunst_path
fi

cp $dunst_path.default $dunst_path

sed -i "s/#2b2b2b/$color0/g" $dunst_path
sed -i "s/#ffffff/$cursor/g" $dunst_path
sed -i "s/#ff0000/$color1/g" $dunst_path

killall dunst
dunst &
