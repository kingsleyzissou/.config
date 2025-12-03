local formatters = { 'jq' }

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
      opts.formatters_by_ft['json'] = opts.formatters_by_ft['json'] or {}
      table.insert(opts.formatters_by_ft['json'], 'jq')
      return opts
    end,
  },
}
