return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewfile' },
  config = function()
    local linter = require('lint')

    linter.linters.shellcheck.args = {
      '-e',
      'SC1091',
      '-e',
      'SC2002',
    }

    linter.linters.pylint.args = {
      '--ignore-modules="osbuild"',
    }

    linter.linters.flake8.args = {
      '--max-line-length=200',
    }

    linter.linters.eslint_d.args = {
      '--format',
      'json',
      '--stdin',
      '--stdin-filename',
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
    }

    linter.linters_by_ft = {
      javascript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescript = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      python = { 'pylint', 'flake8' },
      go = { 'golangcilint' },
      shell = { 'shellcheck' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        linter.try_lint()
      end,
    })
  end,
}
