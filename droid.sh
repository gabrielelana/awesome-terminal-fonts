#!/bin/sh

cp ./fonts/fontawesome-webfont.ttf S0.ttf
./patch S0.ttf --symbols=./fonts/octicons-regular.ttf --rename-as=S1 --starting-at='0xf200' --ratio=1.1 --shift-y=-100
./patch S1.ttf --symbols=./fonts/trellicons-regular.ttf --rename-as=S2 --starting-at='0xf400' --ratio=0.9 --shift-y=150
./patch S2.ttf --symbols=./fonts/pomicons-regular.ttf --rename-as=S3 --starting-at='0xf600' --ratio=0.85
./patch ./fonts/Droid+Sans+Mono+for+Powerline.ttf --symbols=S3.ttf --rename-as='Droid Sans Mono Awesome' --starting-at='0xe100' --ratio=0.85 --shift-x=200 --shift-y=-250
cp Droid+Sans+Mono+Awesome.ttf ~/.fonts
mv Droid+Sans+Mono+Awesome.ttf ./patched
sudo fc-cache -rv
rm -rf S?.ttf
