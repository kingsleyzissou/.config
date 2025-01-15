return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require('conform')

    conform.formatters.prettierd = {
      prepend_args = {
        '--single-quote',
      },
    }

    conform.formatters.autopep8 = {
      prepend_args = {
        '--max-line-length=200',
      },
    }

    conform.setup({
      formatters_by_ft = {
        javascript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescript = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        css = { 'prettierd' },
        html = { 'prettierd' },
        json = { 'jq' },
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
