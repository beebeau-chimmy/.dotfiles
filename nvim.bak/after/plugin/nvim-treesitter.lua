require'nvim-treesitter.configs'.setup({
  -- A list of parser names, or 'all'
  ensure_installed = { 'vim', 'vimdoc', 'query', 'c', 'lua' },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },

  rainbow = { enable = true, extended_mode = true, max_file_lines = nil },
  autopairs = { enabled = true },
  autotag = { enabled = true },
})
