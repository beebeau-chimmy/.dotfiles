local term = require 'wezterm'
local action = term.action
local module = {}

function module.apply_to_config(config)
    config.disable_default_key_bindings = true
    config.enable_tab_bar = false

    config.leader = { key = 'Space', mods = 'CTRL' }
    config.keys = {
        -- [ Panes ]
        { -- Close Current Pane
            key = 'w',
            mods = 'LEADER',
            action = action.CloseCurrentPane { confirm = false }
        },

        -- [ Pane Splits ]
        { -- Horizontal Split
            key = '\\',
            mods = 'LEADER',
            action = term.action.SplitVertical { domain = 'CurrentPaneDomain' }
        },
        { -- Vertical Split
            key = '=',
            mods = 'LEADER',
            action = term.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
        },

        -- [ Focus Panes ]
        {
            key = 'h',
            mods = 'LEADER',
            action = action.ActivatePaneDirection 'Left',
        },
        {
            key = 'l',
            mods = 'LEADER',
            action = action.ActivatePaneDirection 'Right',
        },
        {
            key = 'k',
            mods = 'LEADER',
            action = action.ActivatePaneDirection 'Up',
        },
        {
            key = 'j',
            mods = 'LEADER',
            action = action.ActivatePaneDirection 'Down',
        },

        -- [ Pasting ]
        { key = 'V', mods = 'CTRL', action = action.PasteFrom 'Clipboard' },

        -- [ Resizing Panes ]
        {
            key = 'r',
            mods = 'LEADER|SHIFT',
            action = action.ActivateKeyTable {
                name = 'resize_pane',
                one_shot = false
            }
        },

        -- [ Tabs ]
        { key = 'LeftAlt', mods = 'LEADER', action = action.ShowTabNavigator },
        { key = 'o', mods = 'LEADER', action = action.ActivateTabRelativeNoWrap(1) }, -- Focus next tab
        { key = 'i', mods = 'LEADER', action = action.ActivateTabRelativeNoWrap(-1) }, -- Focus prev tab
        {
            key = 'c',
            mods = 'LEADER',
            action = action.SpawnTab 'CurrentPaneDomain'
        },
    }

    -- [ Key Tables ]
    config.key_tables = {
        resize_pane = {
            { key = 'h', action = action.AdjustPaneSize { 'Left', 5 } },
            { key = 'l', action = action.AdjustPaneSize { 'Right', 5 } },
            { key = 'k', action = action.AdjustPaneSize { 'Up', 5 } },
            { key = 'j', action = action.AdjustPaneSize { 'Down', 5 } },

            -- Cancel the mode by pressing escape
            { key = 'Escape', action = 'PopKeyTable' },
        },
    }

    -- [ Mouse Bindings ]
    config.mouse_bindings = {
        { -- Open Links
            event = { Up = { streak = 1, button = 'Left' } },
            mods = 'CTRL',
            action = action.OpenLinkAtMouseCursor
        },

        { -- Double-click to select word
            event = { Down = { streak = 2, button = 'Left' } },
            mods = 'NONE',
            action = action.SelectTextAtMouseCursor 'Word'
        },

        { -- Triple-click to select line
            event = { Down = { streak = 3, button = 'Left' } },
            mods = 'NONE',
            action = action.SelectTextAtMouseCursor 'Line'
        },
    }
end

return module
