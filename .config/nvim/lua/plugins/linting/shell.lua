local linters = { 'shellcheck' }

return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      for _, tool in ipairs(linters) do
        table.insert(opts.ensure_installed, tool)
      end
      return opts
    end,
  },

  {
    'mfussenegger/nvim-lint',
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.sh = linters

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
