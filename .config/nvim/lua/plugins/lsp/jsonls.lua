local servers = { 'jsonls' }

return {
  {
    'mason-org/mason-lspconfig.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      for _, server in ipairs(servers) do
        table.insert(opts.ensure_installed, server)
      end
      return opts
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers['jsonls'] = {}
      return opts
    end,
  },
}
