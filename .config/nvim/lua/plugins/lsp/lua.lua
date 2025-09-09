local combine = require('utilities.combine')
local server = 'lua_ls'

return {
  {
    'mason-org/mason-lspconfig.nvim',
    opts = combine({ server }),
  },

  {
    'neovim/nvim-lspconfig',
    tag = 'v1.3.0',
    lazy = false,
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers[server] = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'use', 'vim' },
            },
            completion = {
              callSnippet = 'Replace',
            },
            Workspace = {
              checkThirdParty = false,
              maxPreload = 10000,
              preloadFileSize = 10000,
            },
          },
        },
      }
      return opts
    end,
  },
}
