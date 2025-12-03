local formatters = { 'prettierd' }
local supported = {
  'javascript',
  'javascriptreact',
  'typescript',
  'typescriptreact',
  'css',
  'scss',
  'html',
  'http',
  'hbs',
  'markdown',
}

return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      for _, tool in ipairs(formatters) do
        table.insert(opts.ensure_installed, tool)
      end
      return opts
    end,
  },

  {
    'stevearc/conform.nvim',
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      for _, ft in ipairs(supported) do
        opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
        table.insert(opts.formatters_by_ft[ft], 'prettierd')
      end

      opts.formatters = opts.formatters or {}
      opts.formatters.prettierd = {
        -- require_cwd = true,
        prepend_args = {
          '--single-quote',
          '--jsx-single-quote',
        },
      }

      return opts
    end,
  },
}
