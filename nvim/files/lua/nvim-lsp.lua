local lspconfig = require('lspconfig')
local lsp_installer = require("nvim-lsp-installer")
local lsp_installer_servers = require("nvim-lsp-installer.servers")

local buf_keymap = vim.api.nvim_buf_set_keymap
local cmd = vim.cmd
local keymap_opts = {noremap = true, silent = true}

local function on_attach(client)
    buf_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', keymap_opts)
    buf_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', keymap_opts)
    buf_keymap(0, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', keymap_opts)
    buf_keymap(0, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', keymap_opts)
    buf_keymap(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', keymap_opts)
    buf_keymap(0, 'n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<cr>', keymap_opts)
        buf_keymap(0, 'n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', keymap_opts)
    buf_keymap(0, 'n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', keymap_opts)
    print(vim.inspect(client.name))
    print(vim.inspect(client.server_capabilities))
    if client.server_capabilities.documentFormattingProvider then
        print(client.name)
        cmd('au BufWritePre <buffer> lua vim.lsp.buf.format({async = true})')
        buf_keymap(0, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', keymap_opts)
    end
end

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}
local prettier = { formatCommand = 'prettier --stdin-filepath ${INPUT}', formatStdin = true }

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
          rootMarkers = {".git/"},
          languages = {
                python = {
                   {
                    formatCommand = "black --fast -",
                    lintStdin = true,
                    formatStdin = true
                   }
                }
          }

      }
    },
    sumneko_lua = {},
    eslint = {
        -- Found here https://github.com/neovim/nvim-lspconfig/issues/1310
        on_attach = function(client, bufnr)
                on_attach(client, bufnr)
        end,
        settings = {
            format = {
                enable = true
            }
        }

    },
    jedi_language_server = {},
}


lsp_installer.setup({
    automatic_installation = true
})

for server, config in pairs(servers) do
    config.on_attach = config.on_attach or on_attach
    lspconfig[server].setup(config)
end

