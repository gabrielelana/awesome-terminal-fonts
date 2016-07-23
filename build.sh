#!/bin/sh

cd "$(dirname "$0")"

rm -f ./build/*
mkdir -p ./.work

echo 'build all symbols fonts...'
cp ./fonts/pomicons-regular.ttf ./build
cp ./fonts/fontawesome-regular.ttf ./build
cp ./fonts/devicons-regular.ttf ./build

./scripts/fu-relocate ./fonts/octicons-regular.ttf --save-as='.work/octicons-regular-relocated.ttf' --to='0xf300' 2> /dev/null
cp ./.work/octicons-regular-relocated.ttf ./build/octicons-regular.ttf

echo 'export maps for all fonts...'
./scripts/fu-map ./build/pomicons-regular.ttf --namespace 'POMICONS' 2> /dev/null > ./build/pomicons-regular.sh
./scripts/fu-map ./build/octicons-regular.ttf --namespace 'OCTICONS' 2> /dev/null > ./build/octicons-regular.sh
./scripts/fu-map ./build/fontawesome-regular.ttf --namespace 'AWESOME' 2> /dev/null > ./build/fontawesome-regular.sh
./scripts/fu-map ./build/devicons-regular.ttf --namespace 'DEVICONS' 2> /dev/null > ./build/devicons-regular.sh

echo 'override supplied font maps...'
for file in ./fonts/*.sh; do
  [ -f "$file" ] && cp $file ./build
done

echo 'check if fonts are overlapping...'
cat ./build/*.sh | \
  grep 'CODEPOINT_OF' | \
  sed -e "s/^.*\+='\([^']\+\)'/\1/g" | \
  sort | uniq | \
  while read cp; do
    hits=`cat ./build/*.sh | grep $cp | wc -l`
    if [ "$hits" -gt "1" ]; then
      fonts=`\
        cat ./build/*.sh | \
        grep $cp | \
        sed -e 's/^\(CODEPOINT_OF_[^_]\+\).*$/\1/' | \
        sort | uniq | wc -l`
      if [ "$fonts" -gt "1" ]; then
        echo "more than one font defines $cp, found in: "
        cat ./build/*.sh | grep $cp
      fi
    fi
  done

echo 'you can find fonts and maps in local ./build directory :-)'
echo 'done!'
