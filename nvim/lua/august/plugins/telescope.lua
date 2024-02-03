return {
    { 'nvim-telescope/telescope-media-files.nvim' },
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            enabled = vim.fn.executable 'make' == 1,
            build = 'make'
        }
    },
    cmd = 'Telescope',
    opts = function ()
        local telescope = require 'telescope'
        local actions = require 'telescope.actions'
        local fb = require "telescope".extensions.file_browser.actions
        local border_opts = {
            prompt = { "━", "┃", " ", "┃", "┏", "┓", "┃", "┃" },
            results = { "━", "┃", "━", "┃", "┣", "┫", "┛", "┗" },
            preview = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
        }

        telescope.load_extension('fzf')
        telescope.load_extension('repo')
        telescope.load_extension('file_browser')
        telescope.load_extension('ui-select')
        telescope.load_extension('media_files')
        telescope.load_extension('noice')

        return {
            defaults = {
                git_worktrees = vim.g.git_worktrees,
                path_display = { "truncate" },
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = { prompt_position = "top", preview_width = 0.55 },
                    vertical = { mirror = false },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },

                borderchars = border_opts,

                mappings = {
                    i = {
                        ["<C-n>"] = actions.cycle_history_next,
                        ["<C-p>"] = actions.cycle_history_prev,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                    n = { q = actions.close },
                },
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
                    theme = 'get_ivy',
                    -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                    mappings = {
                        ['i'] = {
                            ['<leader>fh'] = fb.goto_home_dir
                        },
                    },
                },

                ui_select = require 'telescope.themes'.get_dropdown(border_opts)
            },

            pickers = {
                find_files = {
                    find_command = { 'rg', '--files', '--hidden=true', '--glob', '!.git/*' }
                }
            },
        }
    end
}
