local signs = {
  { name = 'DiagnosticSignError', text = '🙀' },
  { name = 'DiagnosticSignWarn', text = '😿' },
  { name = 'DiagnosticSignHint', text = '😾' },
  { name = 'DiagnosticSignInfo', text = '😺' },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, {
    texthl = sign.name,
    text = sign.text,
    numhl = '',
  })
end

-- signs = {
--   text = {
--     [vim.diagnostic.severity.ERROR] = '🙀',
--     [vim.diagnostic.severity.WARN] = '😿',
--     [vim.diagnostic.severity.HINT] = '😾',
--     [vim.diagnostic.severity.INFO] = '😺',
--   },

vim.diagnostic.config({
  virtual_lines = false,
  virtual_text = {
    spacing = 4,
    severity_limited = true,
    prefix = '●',
  },
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = 'minimal',
    border = 'rounded',
    source = 'if_many', -- Or "always"
    header = '',
    prefix = '',
  },
})
