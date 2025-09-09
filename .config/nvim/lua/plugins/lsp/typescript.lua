local combine = require('utilities.combine')
local servers = { 'vtsls' }

return {
  {
    'mason-org/mason-lspconfig.nvim',
    opts = combine(servers),
  },

  {
    'youyoumu/pretty-ts-errors.nvim',
    opts = {
      float_opts = {
        wrap = true,
        max_height = 100,
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    tag = 'v1.3.0',
    lazy = false,
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers['vtsls'] = {}
      return opts
    end,
  },
}
