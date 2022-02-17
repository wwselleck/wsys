"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" File Navigation
"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" :Finder -> Open current file in Finder
" ,n -> Toggle file browser (netrw)
" ,j -> Find current file in file browser (netrw)
" ,ff -> Fuzzy search files (Telescope)
" ,fa -> Fuzzy search lines (Telescope)
" ,fl -> Fuzzy search lines in buffer (Telescope)
" ,fb -> Fuzzy search buffers (Telescope)
"""""""""""""""""""""""""""""""""""""""

command! Finder silent exe '!open ' . expand("%:p:h")

"-------------------
" FZF
"-------------------
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({hidden = true})<cr>
nnoremap <leader>fa <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fl <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').commands()<cr>

lua << EOF
require('telescope').setup{
    defaults = {
        file_ignore_patterns = { "node_modules", ".git" }
    },
    pickers = {
        buffers = {
            sort_lastused = true
        }
    }
}

require('telescope').load_extension('fzf')

EOF

set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
nnoremap <leader>e :silent grep<Space>

" Open quickfix list automatically after it's populated
" https://www.reddit.com/r/vim/comments/bmh977/automatically_open_quickfix_window_after/
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END

" Trying out no grepper, just using native vim things
"autocmd VimEnter * nnoremap <Leader>e :Grepper<CR>
"autocmd VimEnter * let g:grepper.tools = ['rg']
"autocmd VimEnter * let g:grepper.rg.grepprg .= ' --hidden'


" "-------------------
" " NERDTree
" "-------------------
" "-------------------
"
" " <leader>n opens nerd tree
" nmap <leader>n :NERDTreeToggle<CR>
" " <leader>j opens current file in tree
" nmap <leader>j :NERDTreeFind<CR>
" " Show hidden files by default
" let NERDTreeShowHidden=1
"
" " Start NERDTree on start when no file given
" "autocmd StdinReadPre * let s:std_in=1
" "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
" " Destroy <c-j> and <c-k> mappings, mapped below
" " http://stackoverflow.com/questions/38599147/how-to-disable-a-nerdtree-mapping-that-conflicts-with-a-custom-mapping
" let g:NERDTreeMapJumpNextSibling = ''
" let g:NERDTreeMapJumpPrevSibling = ''
