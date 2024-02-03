local fb = require "telescope".extensions.file_browser.actions

-- Telescope and extension config
require('telescope').setup({
    pickers = {
        find_files = { find_command = { 'rg', '--files', '--hidden=true', '--glob', '!.git/*' } }
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case'
        },

        repo = {
            list = {
                fd_opts = { '--no-ignore-vcs' },
                search_dirs = { '~/repos' }
            }
        },

        file_browser = {
            theme = 'ivy',
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ['i'] = {
                    ['<leader>fh'] = fb.goto_home_dir
                },
            },
        },

        ['ui-select'] = { require('telescope.themes').get_dropdown {} }
    }
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {} )
vim.keymap.set('n', '<leader>fr', builtin.live_grep, {} )
vim.keymap.set('n', '<leader>bb', builtin.buffers, {} )
vim.keymap.set('n', '<leader>fs',
    function()
      builtin.grep_string( { search = vim.fn.input('Grep -> ') } )
    end)

require('telescope').load_extension('fzf')
require('telescope').load_extension('repo')

require('telescope').load_extension('file_browser')
vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<CR>', {} )

require('telescope').load_extension('ui-select')
