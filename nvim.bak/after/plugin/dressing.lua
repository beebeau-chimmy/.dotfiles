require("dressing").setup {
    input = {
        -- Default prompt string
        default_prompt = "➤ ",

        -- When true, <Esc> will close the modal
        insert_only = true,
        start_in_insert = false,

        -- These are passed to nvim_open_win
        relative = "cursor",
        border = "rounded",

        -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        prefer_width = 40,
        max_width = nil,
        min_width = 20,

        -- see :help dressing_get_config
        get_config = nil,
    },
    select = {
        -- Priority list of preferred vim.select implementations
        backend = { "telescope", "builtin" },

        -- Options for built-in selector
        builtin = {
            -- These are passed to nvim_open_win
            relative = "cursor",
            border = "rounded",

            -- Window options
            win_options = {

                winblend = 10,
            },

            -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
            width = nil,
            max_width = 0.8,
            min_width = 40,
            height = nil,
            max_height = 0.9,
            min_height = 10,
        },

        -- see :help dressing_get_config
        get_config = nil,
    },
}
