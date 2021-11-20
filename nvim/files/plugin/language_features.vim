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


""""""""""""""""""""
" Completion
""""""""""""""""""""
set completeopt=menuone,noselect

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true
let g:compe.source = {}
let g:compe.source.nvim_lsp = v:true
inoremap <silent><expr> <CR>      compe#confirm('<CR>')

""""""""""""""""""""
" Nvim Lightbulb
""""""""""""""""""""
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
