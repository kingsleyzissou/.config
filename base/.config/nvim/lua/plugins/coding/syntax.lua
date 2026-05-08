return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        opts = {
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
    },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install({
        'html',
        'typescript',
        'tsx',
        'javascript',
        'http',
        'json',
        'lua',
        'go',
        'python',
        'toml',
        'yaml',
        'bash',
        'markdown',
        'rust',
        'swift',
        'proto',
      })
    end,
  },
  {
    'theRealCarneiro/hyprland-vim-syntax',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = 'hypr',
  },
}
