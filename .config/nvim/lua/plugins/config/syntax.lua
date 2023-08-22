return {
  {
    -- treesitter
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'http',
        'json',
        'lua',
        'go',
        'python',
        'toml',
        'yaml',
      },
      auto_install = true,
    },
  },

  {
    -- yuck!
    'elkowar/yuck.vim',
  },
}
