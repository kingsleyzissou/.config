if os.getenv('CONTAINER_ID') then
  return {
    'prettier',
    'prettierd',
    'eslint_d',
    'stylua',
    'shellcheck',
    'jq',
  }
end

return {
  'prettier',
  'prettierd',
  'eslint_d',
  'stylua',
  'shellcheck',
  'jq',
  'isort',
  'autopep8',
  'flake8',
  'ruff',
  'goimports',
  'golangci-lint',
}
