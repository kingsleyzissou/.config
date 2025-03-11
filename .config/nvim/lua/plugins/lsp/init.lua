local language_servers = require('plugins.lsp.servers')
local lsp_settings = require('plugins.lsp.settings')
local formatters = require('plugins.lsp.formatters')

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
    config = function()
      require('mason-tool-installer').setup({
        ensure_installed = formatters,
      })
    end,
  },

  {
    -- formatting helper
    'lukas-reineke/lsp-format.nvim',
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
          -- root_dir = lspconfig.util.root_pattern(
          -- '.eslintrc',
          -- '.eslintrc.js',
          -- '.eslintrc.cjs',
          -- '.eslintrc.yaml',
          -- '.eslintrc.yml',
          -- '.eslintrc.json',
          -- 'package.json'
          -- ),
        })
      end
    end,
  },
}
