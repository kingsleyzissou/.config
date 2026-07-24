local servers = { 'jsonls' }

local default_handler = vim.lsp.handlers['textDocument/publishDiagnostics']

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
      opts.servers['jsonls'] = {
        on_attach = function(client, _)
          vim.notify('[jsonls] on_attach fired for client: ' .. client.name, vim.log.levels.INFO)
          client.handlers['textDocument/publishDiagnostics'] = function(err, result, ctx, config)
            if result and result.diagnostics then
              result.diagnostics = vim.tbl_filter(function(d)
                return d.code ~= 519
              end, result.diagnostics)
            end
            return default_handler(err, result, ctx, config)
          end
        end,
      }
      return opts
    end,
  },
}