local function buf_keymap(bufnr, lhs, rhs, description, opts)
  opts = opts or { buffer = bufnr, remap = false, desc = description }
  vim.keymap.set('n', lhs, rhs, opts)
end

local function on_attach(client, buffer)
  buf_keymap(buffer, 'gd', function() Snacks.picker.lsp_definitions() end, 'Go to definition')
  buf_keymap(buffer, 'gD', function() Snacks.picker.lsp_declarations() end, 'Go to declaration')
  buf_keymap(buffer, 'gi', function() Snacks.picker.lsp_implementations() end, 'Go to implementation')
  buf_keymap(buffer, 'gr', function() Snacks.picker.lsp_references() end, 'Go to references')
  buf_keymap(buffer, 'gs', vim.lsp.buf.signature_help, 'Signature help')

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
      {
        '<leader>lj',
        function() vim.diagnostic.jump({ count = 1 }) end,
        desc = 'Next item',
      },
      {
        '<leader>lk',
        function() vim.diagnostic.jump({ count = -1 }) end,
        desc = 'Previous item',
      },
      { '<leader>li', '<cmd>LspInfo<cr>', desc = 'Lsp info' },
    },
    opts = {
      servers = {},
    },
    config = function(_, opts)
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      for server, settings in pairs(opts.servers or {}) do
        vim.lsp.config(server, {
          capabilities = capabilities,
          settings = settings.settings or {},
          filetypes = settings.filetypes,
          handlers = settings.handlers,
          init_options = settings.init_options,
          on_attach = on_attach,
        })
        vim.lsp.enable(server)
      end
    end,
  },
}
