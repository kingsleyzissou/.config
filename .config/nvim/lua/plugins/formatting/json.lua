local combine = require('utilities.combine')
local formatters = { 'jq' }

return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = combine(formatters),
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
