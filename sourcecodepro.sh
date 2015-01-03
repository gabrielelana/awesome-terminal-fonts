#!/bin/sh
cp ./fonts/Sauce\ Code\ Powerline\ Regular.otf S0.ttf
./patch S0.ttf --symbols=./fonts/fontawesome-webfont.ttf --to-namespace=AWESOME --rename-as=S1 --starting-at='0xe100' --ratio=0.8 --shift-x=100 --shift-y=50
./patch S1.ttf --symbols=./fonts/octicons-regular.ttf --to-namespace=OCTICONS --rename-as=S2 --starting-at='0xe800' --ratio=0.8 --shift-y=25
./patch S2.ttf --symbols=./fonts/pomicons-regular.ttf --to-namespace=POMICONS --rename-as='SourceCodePro+Powerline+Awesome Regular' --starting-at='0xf000' --ratio=0.75 --shift-x=-100 --shift-y=25
cat S1.sh S2.sh >> SourceCodePro+Powerline+Awesome+Regular.sh
cp SourceCodePro+Powerline+Awesome+Regular.* ~/.fonts
mv SourceCodePro+Powerline+Awesome+Regular.* ./patched
sudo fc-cache -rv
rm -rf S?.*
