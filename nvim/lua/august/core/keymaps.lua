-----------------------------------------------------------
-- Define keyvim.keymap.sets of Neovim and installed plugins.
-----------------------------------------------------------

-- local function map(mode, lhs, rhs, opts)
--   local options = { norevim.keymap.set = true, silent = true }
--   if opts then
--     options = vim.tbl_extend('force', options, opts)
--   end
--   vim.api.nvim_set_keyvim.keymap.set(mode, lhs, rhs, options)
-- end

vim.g.mapleader = ' '
local map = vim.keymap.set

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

map('', 'q', '<nop>')
map('', 'Q', '<nop>')
map('n', 'R', ':redo<CR>')

-- theprimeagen nvim remaps
map('v', 'J', ':m ">+1<CR>gv=gv"') -- Move hightlighted text
map('v', 'K', ':m "<-2<CR>gv=gv"')
map('n', 'J', 'mzJ`z')
map('n', '<C-j>', '<C-d>zz')
map('n', '<C-k>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('x', '<leader>pp', '\"_dP')
map('n', '<leader>ss', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', { desc = 'Replace all instances of selection' })
map('n', '<leader>X', '<cmd>!chmod +x %<CR>', { desc = 'Make file executable', silent = true })

-- Telescope keybinds
map('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'Telescope - Find Files' })
map('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = 'Telescope - Live Grep' })
map('n', '<leader>fb', ':Telescope file_browser<CR>', { desc = 'Telescope - File Browser' })
map('n', '<leader>fh', ':Telescope help_tags<CR>', { desc = 'Telescope - Help Tags' })

-- map Esc to jj
map('i', 'jj', '<Esc>', { desc = 'NVIM - Normal Mode' })
map('n', 'mm', '<S-a>', { desc = 'NVIM - Insert EOL' })

-- Clear search highlighting with <leader> and c
map('n', 'qq', ':nohl<CR>', { desc = 'NVIM - Clear Highlighting' })

-- Format doc spacing
map('n', '<leader>fd', 'gg v G =', { desc = 'Format Document' })
map('n', '<leader>fs', 'vap =', { desc = 'Format Document' })

-- Toggle auto-indenting for code paste
map('n', '<F2>', ':set invpaste paste?<CR>', { desc = 'NVIM - Toggle autoindenting for code paste' })
-- vim.opt.pastetoggle = 'TT'

-- BarBar keyvim.keymap.sets
-- Move to previous/next
map('n', '<leader>,', '<Cmd>BufferPrevious<CR>', { desc = 'BarBar - Goto Previous Buffer' })
map('n', '<leader>.', '<Cmd>BufferNext<CR>', { desc = 'BarBar - Goto Next Buffer' })
-- Re-order to previous/next
map('n', '<leader><', '<Cmd>BufferMovePrevious<CR>', { desc = 'BarBar - Move Buffer Left' })
map('n', '<leader>>', '<Cmd>BufferMoveNext<CR>', { desc = 'BarBar - Move Buffer Right' })
-- Goto buffer in position...
map('n', '<leader>1', '<cmd>BufferGoto 1<cr>', { desc = 'BarBar - Goto Buffer 1' })
map('n', '<leader>2', '<cmd>BufferGoto 2<cr>', { desc = 'BarBar - Goto Buffer 2' })
map('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', { desc = 'BarBar - Goto Buffer 3' })
map('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', { desc = 'BarBar - Goto Buffer 4' })
map('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', { desc = 'BarBar - Goto Buffer 5' })
map('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', { desc = 'BarBar - Goto Buffer 6' })
map('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', { desc = 'BarBar - Goto Buffer 7' })
map('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', { desc = 'BarBar - Goto Buffer 8' })
map('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', { desc = 'BarBar - Goto Buffer 9' })
map('n', '<leader>0', '<Cmd>BufferLast<CR>', { desc = 'BarBar - Goto Last Buffer' })
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', { desc = 'BarBar - Pin Buffer' })
-- Close buffer
map('n', '<leader>c', '<Cmd>BufferClose<CR>', { desc = 'BarBar - Close Buffer' })

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<leader>h', '<C-w>h', { desc = 'NVIM - Goto Split Window Left' })
map('n', '<leader>j', '<C-w>j', { desc = 'NVIM - Goto Split Window Down' })
map('n', '<leader>k', '<C-w>k', { desc = 'NVIM - Goto Split Window Up' })
map('n', '<leader>l', '<C-w>l', { desc = 'NVIM - Goto Split Window Right' })
-- Close selected split
map('n', '<leader>w', '<C-w>q', { desc = 'NVIM - Close Split' })

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>', { desc = 'Reload NVIM Config' })

-- Close all windows and exit from Neovim with <leader> and q
-- map('n', '<leader>q', ':qa!<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
----------------------------------------------------------

-- Terminal vim.keymap.setpings
map('n', '<leader>;', '<Cmd>exe v:count1 . "ToggleTerm"<CR>', { desc = 'ToggleTerm - Toggle' } )
map('t', 'jj', '<C-\\><C-n>', { desc = 'ToggleTerm - VIM: Enter Normal Mode' })

-- NeoTree
map('n', '<C-n>', ':Neotree toggle right<CR>', { desc = 'NeoTree - Toggle' })
map('n', '<leader>n', ':Neotree toggle right reveal=true<CR>', { desc = 'NeoTree - Toggle Right' })

-- Trouble
map("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Trouble - Toggle" })
map("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = "Trouble - Workspace Diagnostics" })
map("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, { desc = "Trouble - Document Diagnostics" })
map("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = "Trouble - Quickfix" })
map("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Trouble - Loclist" })
map("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = "Trouble - Lsp References" })
map("n", "gd", function() require("trouble").toggle('lsp_definitions') end, { desc = "Trouble - Lsp Definitions" })
map("n", "gD", function() require("trouble").toggle('lsp_type_definitions') end, { desc = "Trouble - Lsp Type Definitions" })

-- Formatting (Conform)
map('n', '<leader>FF', function() require('conform').format() end, { desc = 'Conform - Format Current File' } )


-- Tagbar
-- map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close
