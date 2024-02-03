require('dapui').setup()
require('nvim-dap-virtual-text').setup()

-- nvim-dap keymaps
vim.keymap.set('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>')
vim.keymap.set('n', '<leader>B', ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint Condition: "))<CR>')
vim.keymap.set('n', '<leader>lp', ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
vim.keymap.set('n', '<leader>dr', ':lua require"dap".repl.open()<CR>')

vim.keymap.set('n', '<Ctrl><Down>', ':lua require"dap".step_into()<CR>')
vim.keymap.set('n', '<Ctrl><Right>', ':lua require"dap".step_over()<CR>')
vim.keymap.set('n', '<Ctrl><Up>', ':lua require"dap".continue()<CR>')
vim.keymap.set('n', '<Ctrl><Left>', ':lua require"dap".step_out()<CR>')

-- dapui keymaps
vim.keymap.set('n', '<leader>do', ':lua require"dapui".open()<CR>')
vim.keymap.set('n', '<leader>dc', ':lua require"dapui".close()<CR>')

local dap, dapui = require('dap'), require('dapui')
dap.listeners.after.event_initialized['dapui_config'] = function () dapui.open() end
dap.listeners.before.event_terminated['dapui_config'] = function () dapui.close() end
dap.listeners.before.event_exited['dapui_config'] = function () dapui.close() end


-- Go
vim.keymap.set('n', '<leader>dt', ':lua require"dap-go".debug_test()<CR>')

-- TS
-- JS
-- C++
