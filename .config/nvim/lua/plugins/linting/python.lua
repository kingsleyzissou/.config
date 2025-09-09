local combine = require('utilities.combine')
local linters = { 'pylint', 'flake8' }

return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = combine(linters),
  },

  {
    'mfussenegger/nvim-lint',
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.python = linters

      opts.linters = opts.linters or {}
      opts.linters.pylint = {
        args = {
          '--ignore-modules="osbuild"',
        },
      }

      opts.linters.flake8 = {
        args = {
          '--max-line-length=200',
        },
      }

      return opts
    end,
  },
}
