return {
  {
    -- treesitter
    'nvim-treesitter/nvim-treesitter',
    -- lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'http',
          'json',
          'lua',
          'go',
          'python',
          'toml',
          'yaml',
          'lua',
          'bash',
          'markdown',
        },
        highlight = {
          enable = true,
        },
        auto_install = true,
      })
    end,
  },

  {
    'theRealCarneiro/hyprland-vim-syntax',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = 'hypr',
  },

  {
    -- yuck!
    'elkowar/yuck.vim',
  },
}
