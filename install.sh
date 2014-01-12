#!/bin/sh

cd "$(dirname "$0")"

mkdir -p ~/.fonts
cp -f ./build/*.ttf ~/.fonts
cp -f ./build/*.sh ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d
cp -f ./config/* ~/.config/fontconfig/conf.d
fc-cache -fv ~/.fonts
