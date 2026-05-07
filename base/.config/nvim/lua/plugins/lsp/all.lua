local function buf_keymap(bufnr, lhs, rhs, description, opts)
  opts = opts or { buffer = bufnr, remap = false, desc = description }
  vim.keymap.set('n', lhs, rhs, opts)
end

local function on_attach(client, buffer)
  buf_keymap(buffer, '<leader>fd', '<cmd>Telescope lsp_definitions<cr>', 'Find definition')
  buf_keymap(buffer, '<leader>fD', '<cmd>Telescope lsp_declarations<cr>', 'Find declaration')
  buf_keymap(buffer, '<leader>fi', '<cmd>Telescope lsp_implementations<cr>', 'Find implementation')
  buf_keymap(buffer, '<leader>fr', '<cmd>Telescope lsp_references<cr>', 'Find references')

  -- we'll let conform handle the formatting
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

-- Store server configs globally so they can be accessed after all opts are merged
_G.lsp_server_configs = _G.lsp_server_configs or {}

return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },

  {
    'folke/lazydev.nvim',
    ft = 'lua',
    dependencies = { 'neovim/nvim-lspconfig' },
    config = true,
  },

  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = true,
  },

  {
    'mason-org/mason-lspconfig.nvim',
    lazy = false,
    dependencies = {
      'williamboman/mason.nvim',
    },
    opts = {
      automatic_installation = true,
    },
    config = function(_, opts)
      require('mason-lspconfig').setup({
        ensure_installed = opts.ensure_installed or {},
        automatic_installation = opts.automatic_installation,
      })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
      'mason-org/mason-lspconfig.nvim',
    },
    keys = {
      { '<leader>lp', vim.diagnostic.open_float, desc = 'View diagnostics' },
      { '<leader>la', vim.lsp.buf.code_action, desc = 'Code action' },
      { '<leader>ll', vim.lsp.codelens.run, desc = 'Codelens' },
      { '<leader>lr', vim.lsp.buf.rename, desc = 'Rename' },
      { '<leader>lj', vim.diagnostic.goto_next, desc = 'Next item' },
      { '<leader>lk', vim.diagnostic.goto_prev, desc = 'Previous item' },
      { '<leader>ls', vim.lsp.buf.signature_help, desc = 'Signature help' },
      { '<leader>li', '<cmd>LspInfo<cr>', desc = 'Lsp info' },
    },
    opts = {
      servers = {},
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      for server, settings in pairs(opts.servers or {}) do
        lspconfig[server].setup({
          capabilities = capabilities,
          settings = settings.settings or {},
          filetypes = settings.filetypes,
          handlers = settings.handlers,
          init_options = settings.init_options,
          on_attach = on_attach,
        })
      end
    end,
  },
}
