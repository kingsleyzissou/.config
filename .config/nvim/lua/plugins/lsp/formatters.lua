local formatters = {
  'prettier',
  'prettierd',
  'eslint_d',
  'stylua',
  'shellcheck',
  'jq',
}

if os.getenv('CONTAINER_ID') ~= nil then
  table.insert(formatters, 'isort')
  table.insert(formatters, 'autopep8')
  table.insert(formatters, 'flake8')
  table.insert(formatters, 'ruff')
  table.insert(formatters, 'gofumpt')
  table.insert(formatters, 'goimports')
  table.insert(formatters, 'golangci-lint-langserver')
end

return formatters
