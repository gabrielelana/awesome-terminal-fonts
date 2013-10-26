#!/bin/sh

cp ./fonts/Inconsolata+for+Powerline.ttf S0.ttf
./patch S0.ttf --symbols=./fonts/fontawesome-webfont.ttf --to-namespace=AWESOME --rename-as=S1 --starting-at='0xe100' --ratio=0.85 --shift-x=100 --shift-y=20
./patch S1.ttf --symbols=./fonts/octicons-regular.ttf --to-namespace=OCTICONS --rename-as=S2 --starting-at='0xe800' --ratio=0.85 --shift-y=-50
./patch S2.ttf --symbols=./fonts/pomicons-regular.ttf --to-namespace=POMICONS --rename-as='Inconsolata Awesome' --starting-at='0xf000' --ratio=0.85
cat S1.sh S2.sh >> Inconsolata+Awesome.sh
cp Inconsolata+Awesome.ttf ~/.fonts
mv Inconsolata+Awesome.* ./patched
sudo fc-cache -rv
rm -rf S?.*
