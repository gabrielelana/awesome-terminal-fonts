# Why?
Why do you want to use fancy symbols in your standard monospace font? Obviously to have a fancy prompt like mine :-)

![prompt](https://github.com/gabrielelana/awesome-terminal-fonts/raw/master/why.png)

And because when you live in a terminal a symbol can convey more informations in less space creating a dense and beautiful (for those who have a certain aesthetic taste) informative workspace

Heavily inspired by <https://github.com/Lokaltog/vim-powerline> and the relative patch script from **Kim Silkebækken** (kim.silkebaekken+vim@gmail.com)

# Patching vs Fallback
There are two strategies that could be used to have symbols in a terminal
* you can take a bunch of symbol fonts, your favourite monospace font and merge them together (patching strategy)
* you can use a feature of freetype2 font engine, basically you can say that whenever the current font doesn't have a glyph for a certain codepoint then fallback and go look into other fonts (fallback strategy)

Initially I used the first strategy, later I switched to the second. The patching strategy it's more reliable and portable, the problem is that you need to patch every monospace font you want to use and patching a single font it's a lot of manual fine tuning. If you want you can find all previous patched fonts in [patching-strategy branch](https://github.com/gabrielelana/awesome-terminal-fonts/tree/patching-strategy)

# Font Maps
* Wouldn't be cool to be able to call glyphs/symbols by name (ex. AWESOME_LONG_ARROW_DOWN) instead of by codepoint (ex. \uf175)? This is what font maps are ment for, for every symbol font in `./fonts` directory you can find a map file in `./build` directory that maps each glyph's name to its codepoint in a way that is understandable by most shells

# How to install
* copy all the fonts from `./build` directory to `~/.fonts` directory
* run `fc-cache -fv ~/.fonts` to let freetype2 know of those fonts
* customize the configuration file `./config/10-symbols.conf` replacing `PragmataPro` with the name of the font you want to use in the terminal (I will add more fonts in the future so that this step could be skippable)
* copy the above configuration file to `~/.config/fontconfig/conf.d` directory
