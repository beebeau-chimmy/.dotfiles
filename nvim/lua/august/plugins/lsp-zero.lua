return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {'L3MON4D3/LuaSnip'},
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require('lsp-zero')
            local cmp = require('cmp')
            local lspkind = require('lspkind')

            lsp_zero.extend_cmp()

            cmp.setup({
                formatting = {
                    fields = { "abbr", "kind", "menu" },
                    format = lspkind.cmp_format({
                        mode = 'symbol_text',
                        preset = 'default',
                        symbol_map = {
                            Array = '󰅪',
                            Boolean = '⊨',
                            Key = '󰌆',
                            Namespace = '󰅪',
                            Null = 'NULL',
                            Number = '#',
                            Object = '󰀚',
                            Package = '󰏗',
                            String = '󰀬',
                        }
                    })
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping( cmp.mapping.complete(), { 'i', 'c' } ),
                    ['<Tab>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
                    ['<S-Tab>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                }),
                snippet = {
                    expand = function(args) require 'luasnip'.lsp_expand(args.body) end,
                },
                confirm_opts = {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                },
                window = {
                    completion = cmp.config.window.bordered({
                        border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
                    }),
                    documentation = cmp.config.window.bordered({
                        border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
                    }),
                },
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = {'LspInfo', 'LspInstall', 'LspStart'},
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason-lspconfig.nvim'},
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')

            lsp_zero.preset('recommended')

            lsp_zero.set_preferences({ sign_icons = {
                error = '✘',
                warn = '▲',
                hint = '⚑',
                info = ''
            } })

            -- LSP Enable diagnostics
            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = true,
                underline = true,
                signs = true,
                update_in_insert = false,
                severity_sort = true,
            })

            lsp_zero.extend_lspconfig()

            --- if you want to know more about lsp-zero and mason.nvim
            --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
            lsp_zero.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }

                vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
                vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)

                vim.keymap.set('n', '<leader>K', function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
            end)

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                    'omnisharp',
                    'tsserver',
                    'marksman'
                },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                }
            })

            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end
        end
    }
}
