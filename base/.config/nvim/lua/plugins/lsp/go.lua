local servers = {}

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
      opts.servers['golangci_lint_ls'] = {
        filetypes = { 'go', 'gomod' },
        init_options = {
          command = {
            'golangci-lint',
            'run',
            '--output.json.path=stdout',
            '--output.text.path=',
            '--issues-exit-code=0',
            '--show-stats=false',
            '--path-mode=abs',
          },
        },
      }
      opts.servers['gopls'] = {
        settings = {
          gopls = {
            analyses = {
              simplifycompositelit = false,
            },
          },
        },
      }
      return opts
    end,
  },
}
