local combine = require('utilities.combine')
local formatters = { 'isort', 'ruff', 'autopep8' }

return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = combine(formatters),
  },

  {
    'stevearc/conform.nvim',
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.python = formatters

      opts.formatters = opts.formatters or {}
      opts.formatters.autopep8 = {
        prepend_args = {
          '--max-line-length=200',
        },
      }
      return opts
    end,
  },
}
