-----------------------------------------------------------
-- Define keyvim.keymap.sets of Neovim and installed plugins.
-----------------------------------------------------------

-- local function vim.keymap.set(mode, lhs, rhs, opts)
--   local options = { norevim.keymap.set = true, silent = true }
--   if opts then
--     options = vim.tbl_extend('force', options, opts)
--   end
--   vim.api.nvim_set_keyvim.keymap.set(mode, lhs, rhs, options)
-- end

vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
vim.keymap.set('', '<up>', '<nop>')
vim.keymap.set('', '<down>', '<nop>')
vim.keymap.set('', '<left>', '<nop>')
vim.keymap.set('', '<right>', '<nop>')

vim.keymap.set('', 'q', '<nop>')
vim.keymap.set('', 'Q', '<nop>')

-- theprimeagen nvim remaps
vim.keymap.set('v', 'J', ':m ">+1<CR>gv=gv"') -- Move hightlighted text
vim.keymap.set('v', 'K', ':m "<-2<CR>gv=gv"')
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-j>', '<C-d>zz')
vim.keymap.set('n', '<C-k>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('x', '<leader>pp', '\"_dP')
vim.keymap.set('n', '<leader>ss', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- vim.keymap.set Esc to jj
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', 'mm', '<S-a>')

-- Clear search highlighting with <leader> and c
vim.keymap.set('n', '<Esc><Esc>', ':nohl<CR>')

-- Toggle auto-indenting for code paste
vim.keymap.set('n', '<F2>', ':set invpaste paste?<CR>')
vim.opt.pastetoggle = '<F2>'

-- BarBar keyvim.keymap.sets
-- Move to previous/next
vim.keymap.set('n', '<leader>,', '<Cmd>BufferPrevious<CR>', opts)
vim.keymap.set('n', '<leader>.', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
vim.keymap.set('n', '<leader><', '<Cmd>BufferMovePrevious<CR>', opts)
vim.keymap.set('n', '<leader>>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
vim.keymap.set('n', '<leader>1', '<cmd>BufferGoto 1<cr>', opts)
vim.keymap.set('n', '<leader>2', '<cmd>BufferGoto 2<cr>', opts)
vim.keymap.set('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
vim.keymap.set('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
vim.keymap.set('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
vim.keymap.set('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
vim.keymap.set('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
vim.keymap.set('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', opts)
vim.keymap.set('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', opts)
vim.keymap.set('n', '<leader>0', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
vim.keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
vim.keymap.set('n', '<leader>c', '<Cmd>BufferClose<CR>', opts)

-- Move around splits using Ctrl + {h,j,k,l}
vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>l', '<C-w>l')
-- Close selected split
vim.keymap.set('n', '<leader>w', '<C-w>q')

-- Reload configuration without restart nvim
vim.keymap.set('n', '<leader>r', ':so %<CR>')

-- Close all windows and exit from Neovim with <leader> and q
-- vim.keymap.set('n', '<leader>q', ':qa!<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal vim.keymap.setpings
vim.keymap.set('n', '<leader>;', '<Cmd>exe v:count1 . "ToggleTerm"<CR>' )
vim.keymap.set('t', 'jj', '<C-\\><C-n>')                    -- exit

-- NvimTree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
vim.keymap.set('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file

-- Tagbar
-- vim.keymap.set('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close
