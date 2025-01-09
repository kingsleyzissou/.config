return {
  {
    -- autocomplete
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- snippets
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',

      -- cmp sources
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    opts = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      return {
        preselect = cmp.PreselectMode.None,
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<c-space>'] = cmp.mapping.complete(),
          ['<c-c>'] = cmp.mapping.abort(),
          ['<right>'] = cmp.mapping.confirm({ select = true }),
          ['<cr>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
          ['<tab>'] = cmp.mapping.select_next_item(),
          ['<s-tab>'] = cmp.mapping.select_prev_item(),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'buffer' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'render-markdown' },
        },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        window = {
          documentation = false,
          completion = {
            border = 'none',
            padding = 2,
          },
        },
        experimental = {
          ghost_text = false,
        },
        formatting = {
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, vim_item)
            vim_item.menu = vim_item.kind .. '(' .. entry.source.name .. ')'
            vim_item.kind = require('lspkind').presets.default[vim_item.kind]
            return vim_item
          end,
        },
      }
    end,
  },
}
