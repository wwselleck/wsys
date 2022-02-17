"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" Language Features
"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
"  Normal mode
"  gd -> Go to definition (coc)
"  gy -> Go to type definition (coc)
"  gi -> Go to implementation (coc)
"  gr -> List references (coc)
"  gn -> Go to next diagnostic (coc)
"  gp -> Go to prev diagnostic (coc)
"  K -> Show documentation (coc)
"  <space>a -> List diagnostics (coc)
"  <space>c -> List coc commands (coc)
"  <space>o -> Show symbol outline (coc)
"  <space>s -> Search workspace symbols (coc)
"  <space>p -> Show previous COC list (coc)
"
"  Insert mode
"  <c-l> -> Expand snippet completion
"  <c-j> -> Move to next placeholder in snippet
"  <c-k> -> Move to prev placeholder in snippet
"""""""""""""""""""""""""""""""""""""""

lua require('nvim-lsp')
lua require('treesitter')


""""""""""""""""""""
" Completion
""""""""""""""""""""
set completeopt=menu,menuone,noselect
lua << EOF
    local cmp = require'cmp'
    cmp.setup({
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'buffer' },

        })
    })
EOF

""""""""""""""""""""
" Nvim Lightbulb
""""""""""""""""""""
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
