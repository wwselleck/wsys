# wsys

My (weston, hence the "w") system setup

Each directory is a "module" than contains scripts for installing/updating/etc that module.

e.g
- wsys
  - nvim
    - install.sh

This script can be invoked using `wsys nvim install`

## Installation
`./install`

## Editing modules
`wsys edit <moduleName>`
This will open $VISUAL with the module's directory

## Resources
https://www.moolenaar.net/habits.html
https://github.com/jdhao/nvim-config
https://github.com/rafi/vim-config
https://github.com/lukas-reineke/dotfiles/blob/master/vim/lua/lsp/init.lua
