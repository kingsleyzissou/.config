return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'onsails/lspkind.nvim',
      'L3MON4D3/LuaSnip',
      'saghen/blink.lib',
    },
    opts = {
      snippets = { preset = 'luasnip' },
      sources = {
        -- the path source is a bit annoying for import statements
        -- especially in typescript projects where eslint complains
        -- about extensions
        default = function()
          local success, node = pcall(vim.treesitter.get_node)
          if success and node then
            ---@type TSNode?
            local current = node
            while current do
              local ntype = current:type()
              if
                ntype == 'import_statement'
                or ntype == 'import_declaration'
                or ntype == 'import_from_statement'
                or ntype == 'preproc_include'
              then
                return { 'lsp', 'snippets', 'buffer' }
              end
              current = current:parent()
            end
          end
          return { 'lsp', 'snippets', 'buffer', 'path' }
        end,
        providers = {
          lsp = {
            score_offset = 10,
          },
          path = {
            score_offset = -3,
          },
        },
      },
      keymap = {
        preset = 'default',
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        ['<S-k>'] = { 'scroll_documentation_up', 'fallback' },
        ['<S-j>'] = { 'scroll_documentation_down', 'fallback' },
        ['<cr>'] = { 'accept', 'fallback' },
      },
      fuzzy = { implementation = 'lua' },
    },
  },
}
