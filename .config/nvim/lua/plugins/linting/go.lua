local linters = {}

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
      opts.linters_by_ft.go = linters
      return opts
    end,
  },
}
