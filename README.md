# Why?
Why do you want to use fancy symbols in your standard monospace font? Obviously to have a fancy prompt like mine :-)

![prompt](https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/why.png)

And because when you live in a terminal a symbol can convey more informations in less space creating a dense and beautiful (for those who have a certain aesthetic taste) informative workspace

Heavily inspired by <https://github.com/Lokaltog/vim-powerline> and the relative patch script from **Kim Silkebækken** (kim.silkebaekken+vim@gmail.com)

## Patching vs Fallback
There are two strategies that could be used to have symbols in a terminal
* you can take a bunch of symbol fonts, your favourite monospace font and merge them together (patching strategy)
* you can use a feature of `freetype2` font engine, basically you can say that whenever the current font doesn't have a glyph for a certain codepoint then fallback and go look into other fonts (fallback strategy)

Initially I used the first strategy, later I switched to the second. The patching strategy it's more reliable and portable, the problem is that you need to patch every monospace font you want to use and patching a single font it's a lot of manual fine tuning. If you want you can find all previous patched fonts in [patching-strategy branch](https://github.com/gabrielelana/awesome-terminal-fonts/tree/patching-strategy)

## Font Maps
Referring to glyphs by codepints (eg. `\uf00c`) in your scripts or shell configuration it's not recommended because icon fonts like [Font Awesome](http://fontawesome.io/) use [code points ranges](https://en.wikipedia.org/wiki/Private_Use_Areas) those ranges are not disciplined by the unicode consortium, every font can associate every glyphs to those codepoints. This means that [Font Awesome](http://fontawesome.io/) can choose to move glyphs around freely, today `\uf00c` is associated to the `check` symbol, tomorrow it can be associated to something else. Moreover, more than one icon font can use the same codepoint for different glyphs and if we want to use them both we need to move one of them. So, if you use a codepoint to refer to a glyph after an update that codepoint can point to another glyph. To avoid this situation you can use the font maps in the `./build` directory, font maps are scripts which define shell variables that give names to glyphs, by sourcing those files in your shell you can refer to glyphs by name (eg. `$CODEPOINT_OF_AWESOME_CHECK`).

TLDR: don't refer to glyphs by codepoints (eg. `\uf00c`) but by name (eg. `$CODEPOINT_OF_AWESOME_CHECK`) to make your scripts and shell configurations resilient to future updates. To do that don't forget to copy font maps (`*.sh` files) in the `./build` directory in your home directory and to source them in your shell startup

## Included Fonts
In this repository you can find a bunch of fonts that I use as symbol fonts with the relative font maps
* **Font Awesome 4.7.0**: `./fonts/fontawesome-regular.ttf`, for further informations and license see http://fortawesome.github.io/Font-Awesome
* **Devicons 1.8.0**: `./fonts/devicons-regular.ttf`, for further informations and license see https://github.com/vorillaz/devicons
* **Octicons 1.0.0**: `./fonts/octicons-regular.ttf`, for further informations and license see https://github.com/blog/1135-the-making-of-octicons
* **Pomicons 1.0.0**: `./fonts/pomicons-regular.ttf`, for further informations and license see https://github.com/gabrielelana/pomicons

## How to install (Linux)
* copy all the fonts from `./build` directory to `~/.fonts` directory
* copy all the font maps (all `*.sh` files) from `./build` directory to `~/.fonts` directory
* run `fc-cache -fv ~/.fonts` to let freetype2 know of those fonts
* customize the configuration file `./config/10-symbols.conf` replacing `PragmataPro` with the name of the font you want to use in the terminal (I will add more fonts in the future so that this step could be skippable)
* copy the above configuration file to `~/.config/fontconfig/conf.d` directory
* source the font maps (`source ~/.fonts/*.sh`) in your shell startup script (eg. `~/.bashrc` or `~/.zshrc`)

### Arch Linux
We have been included in the [official repositories](https://www.archlinux.org/packages/community/any/awesome-terminal-fonts/), so if you are running an Arch Linux
* run `pacman -Syu awesome-terminal-fonts`

## How to install (OSX)
* follow [this detailed instructions](https://github.com/gabrielelana/awesome-terminal-fonts/wiki/OS-X) contributed by [@inkrement](https://github.com/inkrement)
* copy all the fonts maps (all `*.sh` files) from `./build` directory to `~/.fonts` directory
* source the font maps (`source ~/.fonts/*.sh`) in your shell startup script (eg. `~/.bashrc` or `~/.zshrc`)
* If it still doesn't work, consider to use the [patching strategy](#patching-vs-fallback)

## How to install (Windows)
* make sure you have permissions to execute Powershell scripts in your machine. To do so, open Windows Powershell as Administrator and paste & run the following command `Set-ExecutionPolicy RemoteSigned`
* then run the install script `./install.ps1`

## License
[MIT](https://github.com/gabrielelana/awesome-terminal-fonts/blob/master/LICENSE)
