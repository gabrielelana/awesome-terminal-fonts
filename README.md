# Patched monospace fonts with awesome symbols for awesome terminals

Heavily inspired by <https://github.com/Lokaltog/vim-powerline> and the relative patch script from **Kim Silkebækken (kim.silkebaekken+vim@gmail.com)**

You can find every patched font in `./patched` directory:
* ./patched/Droid+Sans+Mono+for+Powerline.ttf (for further informations and license see <http://www.droidfonts.com>)

Every font is patched with the following icon fonts:
* ./fonts/fontawesome-webfont.ttf (for further informations and license see <http://fortawesome.github.io/Font-Awesome>)
* ./fonts/octicons-regular.ttf (for further informations and license see <https://github.com/blog/1135-the-making-of-octicons>)
* ./fonts/trellicons-regular.ttf (for further informations and license see <http://blog.fogcreek.com/trello-uses-an-icon-font-and-so-can-you>)

If you use these fonts for <https://github.com/Lokaltog/vim-powerline> then you should have this in your .vimrc

```vimscript
let g:Powerline_symbols = 'fancy'
let g:Powerline_dividers_override = [[0xe0b0], [0xe0b1], [0xe0b2], [0xe0b3]]
let g:Powerline_symbols_override = {
  \ 'BRANCH': [0xe238],
  \ 'RO'    : [0xe0a2],
  \ 'FT'    : [0xe1f6],
  \ 'LINE'  : [0xe0a1],
\ }
```

## How to patch

You need to have installed fontforge with Python bindings. For Ubuntu users the required package is **python-fontforge**, for Arch Linux users the required package is **fontforge**. It should be something similar for other distros.

Every font to patch has a dedicated script because for a really good result some parameters have to be manually tuned :-) so for example to patch by yourself `Droid Sans Mono` you should run

```shell
$ ./droid.sh
```
