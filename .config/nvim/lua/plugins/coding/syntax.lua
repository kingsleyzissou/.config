return {
  {
    -- treesitter
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    -- lazy = false,
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
        'lua',
        'bash',
        'markdown',
        'rust',
      },
      highlight = {
        enable = true,
      },
      auto_install = true,
      textobjects = {
        swap = {
          enable = true,
          swap_next = {
            ['<a-l>'] = '@parameter.inner',
            ['<a-]>'] = '@parameter.inner',
          },
          swap_previous = {
            ['<a-h>'] = '@parameter.inner',
            ['<a-[>'] = '@parameter.inner',
          },
        },
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },

  {
    -- needed for hypr configs
    'theRealCarneiro/hyprland-vim-syntax',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = 'hypr',
  },
}
