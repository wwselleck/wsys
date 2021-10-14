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

""""""""""""""""""""
" Language Server
""""""""""""""""""""
" This is largely based on the config of the guy who made packer.nvim
" https://github.com/wbthomason/dotfiles/blob/387ded8ad4c3cb9d5000edbd3b18bc8cb8a186e9/neovim/.config/nvim/lua/config/lsp.lua
" More reference dotfiles:
" https://www.reddit.com/r/neovim/comments/l6bbrd/can_anyone_give_a_simple_step_by_step_guide_to/
" https://github.com/tomaskallup/dotfiles/tree/master/nvim
lua << EOF
    local lspconfig = require('lspconfig')
    local buf_keymap = vim.api.nvim_buf_set_keymap
    local cmd = vim.cmd

    local keymap_opts = {noremap = true, silent = true}
    local function on_attach(client)
        buf_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', keymap_opts)
        buf_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', keymap_opts)
        buf_keymap(0, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', keymap_opts)
        buf_keymap(0, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', keymap_opts)
        buf_keymap(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', keymap_opts)
        buf_keymap(0, 'n', 'gn', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', keymap_opts)
        buf_keymap(0, 'n', 'gp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', keymap_opts)
        buf_keymap(0, 'n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', keymap_opts)
            print(client.name)
            print(vim.inspect(client.resolved_capabilities))
        if client.resolved_capabilities.document_formatting then

            cmd('au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
            buf_keymap(0, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<cr>', keymap_opts)
        end
    end

    -- https://phelipetls.github.io/posts/configuring-eslint-to-work-with-neovim-lsp/
    local eslint = {
      lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
      lintStdin = true,
      lintFormats = {"%f:%l:%c: %m"},
      lintIgnoreExitCode = true,
      formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename ${INPUT}",
      formatStdin = true
    }

    local servers = {
        tsserver = {
            on_attach = function(client, bufnr)
                client.resolved_capabilities.document_formatting = false
                on_attach(client, bufnr)
            end,
        },
        vimls = {},
        efm = {
          init_options = {documentFormatting = true, codeAction = true},
          settings = {
            languages = {
              javascript = {eslint},
              javascriptreact = {eslint},
              ["javascript.jsx"] = {eslint},
              typescript = {eslint},
              ["typescript.tsx"] = {eslint},
              typescriptreact = {eslint}
            }
          },
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescript.tsx",
            "typescriptreact"
          },
        }
    }

    for server, config in pairs(servers) do
        config.on_attach = config.on_attach or on_attach
        lspconfig[server].setup(config)
    end
EOF




