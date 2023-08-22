return {
  {
    -- copilot
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = '<tab>',
          accept_word = false,
          accept_line = false,
          next = '<m-]>',
          prev = '<m-[>',
          dismiss = '<c-c>',
        },
        enabled = true,
      },
    },
  },

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
      local supertab = require('utilities.supertab')

      return {
        preselect = cmp.PreselectMode.None,
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<c-j>'] = cmp.mapping.select_next_item(),
          ['<c-k>'] = cmp.mapping.select_prev_item(),
          ['<c-space>'] = cmp.mapping.complete(),
          ['<c-c>'] = cmp.mapping.abort(),
          ['<cr>'] = cmp.mapping.confirm({ select = true }),
          ['<right>'] = cmp.mapping.confirm({ select = true }),
          ['<c-y>'] = cmp.mapping.confirm({ select = true }),
          ['<a-tab>'] = cmp.mapping(supertab(1), { 'i', 's' }),
          ['<s-tab>'] = cmp.mapping(supertab(-1), { 'i', 's' }), -- minus one for jumping back
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'buffer' },
          { name = 'nvim_lsp_signature_help' },
        },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        window = {
          documentation = false,
          completion = {
            border = 'rounded',
            winhighlight = 'NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None',
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
