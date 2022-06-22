"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" Color
""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" Tokyonight
let g:tokyonight_style = 'night'

syntax on
" http://stackoverflow.com/questions/4325682/vim-colorschemes-not-changing-background-color
set termguicolors

" This setting affects certain colorschemes (e.g. gruvbox) that have both
" light and dark variations
set background=dark

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

"-------------------
" Rainbow Brackets plugin
" -------------------
let g:rainbow_active = 1

lua << EOF
    require('nvim-web-devicons').setup{}
    local possibleColors = { 'kanagawa', 'tokyodark'  }

    -- This is important for some reason
    math.randomseed(os.time())

    local color = possibleColors[ math.random(#possibleColors) ]
    vim.cmd('colorscheme ' .. color)
EOF
