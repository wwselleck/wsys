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

        cmd('au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 5000)')
        buf_keymap(0, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<cr>', keymap_opts)
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
      cmd = {'efm-langserver', '-logfile', '/tmp/efm.log', '-loglevel', '10'},
      settings = {
        languages = {
          javascript = {eslint},
          javascriptreact = {eslint},
          ["javascript.jsx"] = {eslint},
          typescript = {eslint},
          ["typescript.tsx"] = {eslint},
          typescriptreact = {eslint, prettier}
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
      rootMarkers = {'package.json'}
    },
}

for server, config in pairs(servers) do
    config.on_attach = config.on_attach or on_attach
    lspconfig[server].setup(config)
end
