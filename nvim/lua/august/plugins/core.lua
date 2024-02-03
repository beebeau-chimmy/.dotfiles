return {
  -- Folke
  { 'folke/lazy.nvim', version = false },
  { 'folke/which-key.nvim' },
  { 'folke/neoconf.nvim', cmd = 'Neoconf' },
  {
    'folke/neodev.nvim',
    -- To enable type checking for nvim-dap-ui
    opts = {
      library = { plugins = { 'nvim-dap-ui' }, types = true }
    }
  },

  -- UI
  { 'MunifTanjim/nui.nvim' },
  { 'folke/trouble.nvim' },
  { 'rktjmp/lush.nvim' },

  -- Indent line
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },

  { 'nvim-treesitter/nvim-treesitter' },
  { 'nvim-treesitter/nvim-treesitter-context' },

  { 'hiphish/rainbow-delimiters.nvim' },

  { 'nvim-treesitter/playground' },

  { 'altermo/ultimate-autopair.nvim' },

  { 'windwp/nvim-ts-autotag' },

  -- nvim-tree (File explorer)
  { 'nvim-neo-tree/neo-tree.nvim' },
  { 'nvim-tree/nvim-web-devicons',
    config = function ()
      require 'nvim-web-devicons'.setup{}
    end
  },

  { 'stevearc/dressing.nvim' },

  -- gitsigns.nvim
  { 'lewis6991/gitsigns.nvim' },

  -- barbar.nvim
  { 'romgrk/barbar.nvim' },
  { 'kyazdani42/nvim-web-devicons',              lazy = true },

  -- LuaLine
  { 'nvim-lualine/lualine.nvim' },
  { 'kyazdani42/nvim-web-devicons',              lazy = true },

  -- Telescope (Better fzf-lua)
  { 'nvim-telescope/telescope.nvim' },
  { 'nvim-telescope/telescope-fzf-native.nvim' },
  { 'nvim-telescope/telescope-ui-select.nvim' },

  { 'nvim-lua/plenary.nvim' },

  -- telescope extensions
  { 'cljoly/telescope-repo.nvim' },
  { 'nvim-telescope/telescope-file-browser.nvim' },
  { 'nvim-telescope/telescope-ui-select.nvim' },

  -- Comment.nvim
  { 'numToStr/Comment.nvim', lazy = false,
    config = function ()
      require('Comment').setup()
    end
  },

  -- Toggleterm
  { 'akinsho/nvim-toggleterm.lua', version = '*', config = true },

  -- Markdown
  { 'ellisonleao/glow.nvim', config = true, cmd = 'Glow' },

  -- icon picker
  { 'ziontee113/icon-picker.nvim' },

  -- [ LSP Configuration ]
  { 'VonHeikemen/lsp-zero.nvim',                 branch = 'v3.x' },
  -- LSP Support
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'nvimtools/none-ls.nvim' },

  -- Autocompletion
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-nvim-lua' },
  -- Snippets
  { 'L3MON4D3/LuaSnip' },
  { 'rafamadriz/friendly-snippets' },

  { 'folke/neodev.nvim' },
  { 'onsails/lspkind.nvim' },
  { 'ray-x/lsp_signature.nvim' },

  -- [ DAP ]
  { 'mfussenegger/nvim-dap' },
  { 'rcarriga/nvim-dap-ui', lazy = true, config = function() require('dapui').setup() end },
  { 'theHamsta/nvim-dap-virtual-text' },

  {
    'barrett-ruth/live-server.nvim',
    build = 'npm -g i live-server',
    config = true
  },

  { 'nvim-lua/plenary.nvim' },

  { 'rest-nvim/rest.nvim',  dependencies = { 'nvim-lua/plenary.nvim' } }
}
