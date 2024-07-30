return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require('conform')

    conform.formatters.prettier = {
      prepend_args = { '--single-quote' },
    }

    conform.formatters.autopep8 = {
      prepend_args = {
        '--max-line-length=200',
      },
    }

    conform.setup({
      formatters_by_ft = {
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'jq' },
        -- yaml = { 'prettier' },
        lua = { 'stylua' },
        go = { 'goimports' },
        python = { 'isort', 'ruff', 'autopep8' },
        ['*'] = { 'trim_whitespace' },
      },
      format_on_save = {
        lsp_fallback = false,
        async = false,
        timeout_ms = 1000,
      },
    })
  end,
}
