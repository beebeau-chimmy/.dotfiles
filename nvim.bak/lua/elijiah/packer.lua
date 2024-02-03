-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme


-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
-- For setting up plenary with much less code
-- local plenary_conf_obj = require ('plenary_init.lua')

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

vim.g.termguicolors = true

-- Install plugins
return packer.startup( function(use)
-- [ Core ]
  use 'wbthomason/packer.nvim' -- packer can manage itself

-- [ Appearances/Customization ]
  -- ccc.nvi ( color picker and colorizer )
  use 'uga-rosa/ccc.nvim'
  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  -- Indent line
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-context',
    'p00f/nvim-ts-rainbow',

    run = ':TSUpdate'
  }
  use 'nvim-treesitter/playground'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  -- nvim-tree (File explorer)
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use 'stevearc/dressing.nvim'

  -- catppuccin.nvim
  use { 'catppuccin/nvim', as = 'catppuccin' }
  -- gitsigns.nvim
  use 'lewis6991/gitsigns.nvim'
  -- barbar.nvim
  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- LuaLine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }
  -- Telescope (Better fzf-lua)
  use { 'nvim-telescope/telescope.nvim',
    -- Fzf-native ( Telescope extension for better performance )
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    requires = { 'nvim-lua/plenary.nvim' }
  }
  -- telescope extensions
  use 'cljoly/telescope-repo.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'

  -- Comment.nvim
  use 'numToStr/Comment.nvim'
  -- Toggleterm
  use 'akinsho/nvim-toggleterm.lua'
  -- tpope
  -- use 'tpop/vim-eunuch'
  -- Markdown
  use { 'ellisonleao/glow.nvim', cmd = 'Glow' }
  use {
    'iamcco/markdown-preview.nvim',
    run = { function() fn['mkdp#util#install']() end,
    "cd app && npm install",
    },
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" }
  }
  -- icon picker
  use 'ziontee113/icon-picker.nvim'

  -- [ LSP Configuration ]
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
  use 'folke/neodev.nvim'
  use 'onsails/lspkind.nvim'
  use 'ray-x/lsp_signature.nvim'

  -- [ DAP ]
  use 'mfussenegger/nvim-dap'
  use { 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }
  use 'theHamsta/nvim-dap-virtual-text'

  use {
      'aurum77/live-server.nvim',
      run = function() require('live_server.util').install() end,
      cmd = { 'LiveServer', 'LiveServerStart', 'LiveServerStop' }
  }
  use 'nvim-lua/plenary.nvim'
  use { 'rest-nvim/rest.nvim', requires = { 'nvim-lua/plenary.nvim' }}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').update().sync()
  end

end)
