local servers = { 'vtsls' }

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
      opts.servers['vtsls'] = {
        settings = {
          typescript = {
            preferences = {
              importModuleSpecifier = 'shortest',
              importModuleSpecifierEnding = 'minimal',
            },
          },
        },
        handlers = {
          ['textDocument/publishDiagnostics'] = function(err, result, ctx)
            if result and result.diagnostics then
              result.diagnostics = vim.tbl_filter(function(d)
                if d.code == 6133 and d.message:match("'React'") then
                  return false
                end
                return true
              end, result.diagnostics)
            end
            default_handler(err, result, ctx)
          end,
        },
      }
      return opts
    end,
  },
}
