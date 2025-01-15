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
    -- neodev
    'folke/neodev.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    library = { plugins = { 'neotest' }, types = true },
    config = true,
  },
}
