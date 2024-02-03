return {
    -- catppuccin
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            -- Loading colorscheme
            -- vim.cmd('colorscheme catppuccin-mocha')
        end
    },

    -- gruvbox
    {
        'ellisonleao/gruvbox.nvim',
        priority = 1000,
        config = function()
            -- Loading colorscheme
            -- vim.cmd('colorscheme gruvbox')
        end
    },

    -- bamboo
    {
        'ribru17/bamboo.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('bamboo').setup{}
            require('bamboo').load()
            vim.cmd('colorscheme bamboo-multiplex')
        end
    },

    -- kimbox
    {
        'lmburns/kimbox',
        lazy = false,
        priority = 1000,
        config = function ()
            -- vim.cmd('colorscheme kimbox')
        end
    },

    -- melange
    {
        'savq/melange-nvim',
        lazy = false,
        priority = 1000,
        config = function ()
            vim.opt.termguicolors = true
            -- vim.cmd('colorscheme melange')
        end
    },

    {
        'uloco/bluloco.nvim',
        lazy = false,
        priority = 1000,
        dependencies = { 'rktjmp/lush.nvim' },
        config = function()
            vim.opt.termguicolors = true
            -- vim.cmd('colorscheme bluloco')
        end,
    },

    -- rose-pine
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
        config = function ()
            -- vim.cmd('colorscheme rose-pine-moon')
        end
    },

    -- nightfox
    {
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
        config = function ()
            -- vim.cmd('colorscheme nightfox')
        end
    },

    -- palenightfall
    -- 'JoosepAlviste/palenightfall.nvim',
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --     require('palenightfall').setup()
    -- end
}
