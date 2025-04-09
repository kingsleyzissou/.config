return {
  {
    -- manage lazy from lazy
    'folke/lazy.nvim',
  },

  {
    -- setup
    'nvim-lua/plenary.nvim',
  },

  {
    -- lazydev
    'folke/lazydev.nvim',
    ft = 'lua',
    dependencies = { 'neovim/nvim-lspconfig' },
    config = true,
    opts = {
      { path = 'LazyVim', words = { 'LazyVim' } },
    },
  },
}
