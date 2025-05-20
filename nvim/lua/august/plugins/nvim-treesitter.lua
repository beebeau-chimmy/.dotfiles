return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function () require('nvim-treesitter.configs').setup({
      ensure_installed = { 'vim', 'vimdoc', 'query', 'c', 'lua', 'javascript', 'typescript', 'html', 'svelte', 'sql', 'json', 'python', 'markdown' },
      sync_install = false,
      auto_install = true,
      highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
      },
      indent = { enable = true },
      rainbow = { enable = true, extended_mode = true, max_file_lines = nil },
      autopairs = { enabled = true },
      autotag = { enabled = true },
  })
  end
}
