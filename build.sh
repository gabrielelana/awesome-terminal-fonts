#!/bin/sh

echo 'build all symbols fonts...'
cp -rf ./fonts/* ./build/

echo 'export maps for all fonts...'
./scripts/fu-map ./build/pomicons-regular.ttf --namespace 'POMICONS' 2>/dev/null > ./build/pomicons-regular.sh
./scripts/fu-map ./build/octicons-regular.ttf --namespace 'OCTICONS' 2>/dev/null > ./build/octicons-regular.sh
./scripts/fu-map ./build/fontawesome-webfont.ttf --namespace 'AWESOME' 2>/dev/null > ./build/fontawesome-webfont.sh

echo 'you can find fonts and maps in local ./build directory :-)'
echo 'done!'
