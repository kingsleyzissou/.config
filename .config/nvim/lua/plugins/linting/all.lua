return {
  'mfussenegger/nvim-lint',
  lazy = false,
  event = { 'BufReadPre', 'BufNewfile' },
  config = function(_, opts)
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    require('lint').linters_by_ft = opts.linters_by_ft
    require('lint').linters = opts.linters

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
