local combine = require('utilities.combine')
local formatters = { 'goimports', 'gofumpt' }

return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = combine(formatters),
  },

  {
    'stevearc/conform.nvim',
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.go = formatters
      return opts
    end,
  },
}
