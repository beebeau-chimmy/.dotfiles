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
            markdown = {
                headings = presets.headings.marker,
                tables = presets.tables.single
            }
        })
        require('markview.extras.checkboxes').setup()
        require('markview.extras.editor').setup()
        require('markview.extras.headings').setup()
    end
}
