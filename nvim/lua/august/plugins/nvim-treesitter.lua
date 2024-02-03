return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    -- A list of parser names, or 'all'
    ensure_installed = { 'vim', 'vimdoc', 'query', 'c', 'lua', 'javascript', 'typescript', 'html', 'svelte' },
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
  }
}
