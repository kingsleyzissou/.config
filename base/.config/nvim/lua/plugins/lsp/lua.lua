local server = 'lua_ls'

return {
  {
    'mason-org/mason-lspconfig.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, server)
      return opts
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers[server] = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'use', 'vim', 'Snacks' },
            },
            completion = {
              callSnippet = 'Replace',
            },
            workspace = {
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
