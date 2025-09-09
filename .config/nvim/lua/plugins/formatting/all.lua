return {
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      formatters_by_ft = {
        ['*'] = { 'trim_whitespace' },
      },
      format_on_save = {
        lsp_fallback = false,
        async = false,
        timeout_ms = 1000,
      },
    },
  },
}
