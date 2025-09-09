local combine = require('utilities.combine')
local linters = { 'eslint_d' }

local supported = {
  'javascript',
  'javascriptreact',
  'typescript',
  'typescriptreact',
}

return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = combine(linters),
  },

  {
    'mfussenegger/nvim-lint',
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      for _, ft in ipairs(supported) do
        opts.linters_by_ft[ft] = opts.linters_by_ft[ft] or {}
        table.insert(opts.linters_by_ft[ft], 'eslint_d')
      end

      opts.linters = opts.linters or {}
      opts.linters.eslint_d = {
        args = {
          '--format',
          'json',
          '--stdin',
          '--stdin-filename',
          function()
            return vim.api.nvim_buf_get_name(0)
          end,
        },
      }

      return opts
    end,
  },
}
