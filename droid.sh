#!/bin/sh

cp ./fonts/Droid+Sans+Mono+for+Powerline.ttf S0.ttf
./patch S0.ttf --symbols=./fonts/fontawesome-webfont.ttf --to-namespace=AWESOME --rename-as=S1 --starting-at='0xe100' --ratio=0.9 --shift-x=200 --shift-y=-300
./patch S1.ttf --symbols=./fonts/octicons-regular.ttf --to-namespace=OCTICONS --rename-as=S2 --starting-at='0xe800' --ratio=0.85 --shift-x=-100 --shift-y=-100
./patch S2.ttf --symbols=./fonts/pomicons-regular.ttf --to-namespace=POMICONS --rename-as='Droid Sans Mono Awesome' --starting-at='0xf000' --ratio=0.85 --shift-y=-400 --shift-x=-600
cat S1.sh S2.sh >> Droid+Sans+Mono+Awesome.sh
cp Droid+Sans+Mono+Awesome.* ~/.fonts
mv Droid+Sans+Mono+Awesome.* ./patched
sudo fc-cache -rv
rm -rf S?.*
