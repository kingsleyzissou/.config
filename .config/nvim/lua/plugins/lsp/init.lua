local language_servers = require('plugins.lsp.servers')
local lsp_settings = require('plugins.lsp.settings')

local file_exists = function(file)
  local f = io.open(file, 'r')
  if f ~= nil then
    io.close(f)
    return true
  end
  return false
end

return {
  {
    -- setup mason first, the order is important
    'williamboman/mason.nvim',
    config = true,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      local servers = {}
      for server, _ in pairs(language_servers) do
        table.insert(servers, tostring(server))
      end
      require('mason-lspconfig').setup({
        ensure_installed = servers,
      })
    end,
  },

  {
    -- ensure formatters are installed
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      ensure_installed = { 'prettierd', 'shellcheck', 'jq', 'stylua' },
    },
  },

  {
    -- formatting helper
    'lukas-reineke/lsp-format.nvim',
  },

  {
    -- null-ls
    -- TODO: this is deprecated
    -- - maybe nvim-lint for linting
    -- - conform.nvim for formatting
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        on_attach = lsp_settings.on_attach,
        sources = {
          -- code actions
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.code_actions.eslint_d,
          -- formatting
          null_ls.builtins.formatting.prettierd.with({
            filetypes = {
              'javascript',
              'javascriptreact',
              'typescript',
              'typescriptreact',
            },
            extra_args = {
              '--single-quote',
              '--jsx-single-quote',
            },
          }),
          null_ls.builtins.formatting.autopep8,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.goimports,
          null_ls.builtins.formatting.gofmt,
          null_ls.builtins.formatting.trim_whitespace,
          -- define missing diagnostics
          null_ls.builtins.diagnostics.eslint_d.with({
            extra_args = function(params)
              local file_types = { 'js', 'cjs', 'yaml', 'yml', 'json' }
              for _, file_type in pairs(file_types) do
                if file_exists(params.root .. '/.eslintrc.' .. file_type) then
                  return {}
                end
              end

              return {
                '--config',
                vim.fn.expand('~/.config/eslint/.eslintrc.json'),
              }
            end,
          }),
          null_ls.builtins.diagnostics.shellcheck.with({
            extra_args = {
              '-e',
              'SC1091',
              '-e',
              'SC2002',
            },
          }),
        },
        log = { enabled = true, level = 'trace' },
      })
    end,
  },

  {
    -- symbol usage indicator
    'Wansmer/symbol-usage.nvim',
    event = 'BufReadPre',
    config = true,
  },

  {
    -- lsp/ui  thing
    'onsails/lspkind-nvim',
  },

  {
    -- file operations (i.e. file rename)
    'antosha417/nvim-lsp-file-operations',
    config = true,
  },

  {
    -- setup lspconfig last
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'antosha417/nvim-lsp-file-operations',
    },
    keys = {
      { 'K', vim.lsp.buf.hover, desc = 'Hover' },
      { '<leader>la', vim.lsp.buf.code_action, desc = 'Code action' },
      { '<leader>lp', vim.diagnostic.open_float, desc = 'View diagnostics' },
      { '<leader>ll', vim.lsp.codelens.run, desc = 'Codelens' },
      { '<leader>lf', vim.lsp.buf.format, desc = 'Format' },
      { '<leader>lr', vim.lsp.buf.rename, desc = 'Rename' },
      { '<leader>lj', vim.diagnostic.goto_next, desc = 'Next item' },
      { '<leader>lk', vim.diagnostic.goto_prev, desc = 'Previous item' },
      { '<leader>ls', vim.lsp.buf.signature_help, desc = 'Signature help' },
      { '<leader>li', '<cmd>LspInfo<cr>', desc = 'Lsp info' },
    },
    config = function()
      local lspconfig = require('lspconfig')
      for server, settings in pairs(language_servers) do
        lspconfig[server].setup({
          on_attach = lsp_settings.on_attach,
          capabilities = lsp_settings.capabilities,
          settings = settings,
        })
      end
    end,
  },
}
