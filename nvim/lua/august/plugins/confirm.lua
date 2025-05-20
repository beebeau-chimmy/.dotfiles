return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            markdown = { 'prettier', 'markdown-toc' },
            json = { 'prettier' }
        }
    },
}
