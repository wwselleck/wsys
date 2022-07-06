local dap = require('dap')

dap.adapters.python = {
    type = "executable",
    command = "python",
    args = { '-m', 'debugpy.adapter' }
}

dap.configurations.python = {
    {
        type = 'python';
        request = 'launch';
        name = "Launch file";

        program = "${file}"
    }
}

vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

vim.keymap.set('n', '<leader>db', function() require"dap".toggle_breakpoint() end)
vim.keymap.set('n', '<leader>ds', function() require"dap".continue() end)
vim.keymap.set('n', '<leader>dr', function() require"dap".repl.toggle() end)

 dap.defaults.fallback.terminal_win_cmd = '50vsplit new'
