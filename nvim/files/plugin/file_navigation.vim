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
