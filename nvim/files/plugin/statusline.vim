lua << EOF
    require("lualine").setup{
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', {
                'diagnostics',
                sources = { 'nvim_lsp' }
            } }
        }
    }
EOF
