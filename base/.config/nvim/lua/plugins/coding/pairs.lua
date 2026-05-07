return {
  {
    -- auto-pairs
    'windwp/nvim-autopairs',
    event = 'VeryLazy',
    opts = {
      fast_wrap = {},
      disable_filetype = { 'TelescopePrompt', 'vim' },
    },
  },

  {
    -- matching keywords, i.e. if/end
    'tpope/vim-endwise',
    event = 'VeryLazy',
  },
}
