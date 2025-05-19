local term = require 'wezterm'
local binds = require 'binds'

local config = term.config_builder()
config.automatically_reload_config = true

-- [ Window ]
config.window_decorations = 'NONE'
config.initial_cols = 150
config.initial_rows = 35
config.window_background_opacity = 0.97

-- [ Term ]
config.window_close_confirmation = 'NeverPrompt'
config.skip_close_confirmation_for_processes_named = {
    'bash',
    'sh',
    'zsh',
    'fish',
    'tmux',
    'nu',
    'cmd.exe',
    'pwsh.exe',
    'powershell.exe',
}

-- [ Styling ]
config.font_size = 18
config.font = term.font_with_fallback {
    {
        family = 'IosevkaTerm Nerd Font',
        weight = 'Medium'
    },
    'Apple Color Emoji'
}

-- [ Misc ]
term.on('update-right-status', function(window, pane)
    local name = window:active_key_table()
    if name then
        name = 'TABLE: ' .. name
    end
    window:set_right_status(name or '')
end)

-- Source all needed modules
binds.apply_to_config(config)

return config
