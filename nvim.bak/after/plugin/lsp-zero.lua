local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.set_preferences({ sign_icons = {
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

local border_style = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
}

local pop_opts = { border = border_style }
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, pop_opts)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)

-- LSP Config for just the tsserver lsp
require("lspconfig").tsserver.setup {
    on_attach = function(client)
        require("lsp_signature").on_attach {
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            doc_lines = 2, -- will show 2 lines of comment/doc(if there are more than 2 lines in doc, will be truncated)
            -- set to 0 if you DO NOT want any API comments be shown
            -- This setting only take effect in insert mode, it does not affect signature help in normal
            -- mode, 10 by default

            floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
            hint_enable = true,
            hint_prefix = "🌟 ",
            hint_scheme = "String",
            use_lspsaga = false,
            hi_parameter = "PmenuSel", -- hl-search
            max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
            -- to view the hiding contents
            max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
            handler_opts = {
                border = "single", -- double, single, shadow, none
            },
            extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
        }

        local ts_utils = require "nvim-lsp-ts-utils"

        -- defaults
        ts_utils.setup {
            debug = false,
            disable_commands = false,
            enable_import_on_completion = true,
            import_all_timeout = 5000, -- ms

            -- eslint
            -- using eslint lsp directly now, see below
            eslint_enable_code_actions = false,
            eslint_enable_disable_comments = false,
            eslint_bin = "eslint",
            eslint_config_fallback = nil,
            eslint_enable_diagnostics = false,

            -- TODO: try out update imports on file move
            update_imports_on_move = true,
            require_confirmation_on_move = false,
            watch_dir = nil,
        }
        -- required to fix code action ranges
        ts_utils.setup_client(client)
        -- disable tsserver formatting
        client.server_capabilities.document_formatting = false
    end
}

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- cmp config
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
    sources = {
        { name = 'nvim_lsp' }
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-C>'] = cmp.mapping.complete()
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    }
})

-- mason config
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'omnisharp',
        'tsserver',
        'marksman'
    },
    handlers = {
        lsp.default_setup
    }
})

-- autopairs config for cmp
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

lsp.on_attach(
function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', '<leader>K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)

    vim.keymap.set('n', 'K', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
end)

require('neodev').setup()
