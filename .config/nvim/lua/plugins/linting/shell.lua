local combine = require('utilities.combine')
local linters = { 'shellcheck' }

return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = combine(linters),
  },

  {
    'mfussenegger/nvim-lint',
    config = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.shell = linters

      opts.linters = opts.linters or {}
      opts.linters.shellcheck = {
        args = {
          '-e',
          'SC1091',
          '-e',
          'SC2002',
        },
      }

      return opts
    end,
  },
}
