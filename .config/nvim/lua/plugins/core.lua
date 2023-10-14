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

  {
    -- notifications - get these setup early
    'rcarriga/nvim-notify',
    lazy = false,
    keys = function()
      return {
        { '<leader>nd', require('notify').dismiss, desc = 'Dismiss notifications' },
      }
    end,
    init = function()
      require('notify').setup({
        background_colour = '#24283b',
      })
    end,
    -- config = true,
  },
}
