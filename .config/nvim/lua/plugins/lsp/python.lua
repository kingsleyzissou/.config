local combine = require('utilities.combine')
local servers = { 'jedi_language_server' }

return {
  {
    'mason-org/mason-lspconfig.nvim',
    opts = combine(servers),
  },

  {
    'neovim/nvim-lspconfig',
    tag = 'v1.3.0',
    lazy = false,
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers['jedi_language_server'] = {}
      return opts
    end,
  },
}
