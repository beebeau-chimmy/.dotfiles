return {
    "OXY2DEV/markview.nvim",
    lazy = false,      -- Recommended
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local presets = require('markview.presets')
        require('markview').setup({
            checkboxes = presets.checkboxes.nerd,
            headings = presets.headings.marker
        })
    end
}
