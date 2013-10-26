#!/bin/sh

cp ./fonts/fontawesome-webfont.ttf S0.ttf
./patch S0.ttf --symbols=./fonts/octicons-regular.ttf --rename-as=S1 --starting-at='0xf200' --shift-y=-50
./patch S1.ttf --symbols=./fonts/trellicons-regular.ttf --rename-as=S2 --starting-at='0xf400' 
./patch S2.ttf --symbols=./fonts/pomicons-regular.ttf --rename-as=S3 --starting-at='0xf600' --ratio=0.85
./patch ./fonts/Inconsolata+for+Powerline.ttf --symbols=S3.ttf --rename-as='Inconsolata Awesome' --starting-at='0xe100' --ratio=0.85 --shift-x=100 --shift-y=20
cp Inconsolata+Awesome.ttf ~/.fonts
mv Inconsolata+Awesome.ttf ./patched
sudo fc-cache -rv
rm -rf S?.ttf
