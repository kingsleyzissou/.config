return {
  {
    -- auto-pairs
    'windwp/nvim-autopairs',
    event = 'VeryLazy',
    opts = {
      fast_wrap = {},
      disable_filetype = { 'vim' },
    },
  },

  {
    'windwp/nvim-ts-autotag',
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    },
  },

  {
    -- matching keywords, i.e. if/end
    'tpope/vim-endwise',
    event = 'VeryLazy',
  },
}
