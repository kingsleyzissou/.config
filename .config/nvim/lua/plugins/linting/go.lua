local combine = require('utilities.combine')
local linters = { 'golangci-lint' }

return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = combine(linters),
  },

  {
    'mfussenegger/nvim-lint',
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.go = linters
      return opts
    end,
  },
}
