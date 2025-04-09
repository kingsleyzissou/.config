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
  -- pin golangci-lint for now because v2 breaks things
  table.insert(formatters, { 'golangci-lint', version = 'v1.54.2' })
end

return formatters
