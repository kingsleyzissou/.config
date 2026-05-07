return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'onsails/lspkind.nvim',
      'L3MON4D3/LuaSnip',
      'moyiz/blink-emoji.nvim',
    },
    opts = {
      snippets = { preset = 'luasnip' },
      sources = {
        default = { 'lsp', 'snippets', 'buffer', 'path', 'emoji' },
        providers = {
          emoji = {
            module = 'blink-emoji',
            name = 'Emoji',
            score_offset = 15,
            opts = {
              insert = true,
              trigger = { ':' },
            },
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
