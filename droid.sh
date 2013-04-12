#!/bin/sh

cp ./fonts/fontawesome-webfont.ttf S0.ttf
./patch S0.ttf --symbols=./fonts/octicons-regular.ttf --rename-as=S1 --starting-at='0xf200' --ratio=1.1 --shift-y=-100
./patch S1.ttf --symbols=./fonts/trellicons-regular.ttf --rename-as=S2 --starting-at='0xf400' 
./patch ./fonts/Droid+Sans+Mono+for+Powerline.ttf --symbols=S2.ttf --starting-at='0xe100' --ratio=0.9 --shift-x=100 --shift-y=-200
cp Droid+Sans+Mono+for+Powerline.ttf ~/.fonts
mv Droid+Sans+Mono+for+Powerline.ttf ./patched
sudo fc-cache -rv
rm -rf S?.ttf
