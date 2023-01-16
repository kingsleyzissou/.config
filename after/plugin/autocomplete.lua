local cmp = require('cmp')
local luasnip = require('luasnip')

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local function super_tab(fallback)
  if cmp.visible() then
    cmp.select_next_item()
    return
  end
  if luasnip.expandable() then
    luasnip.expand({ jump_into_function = false })
    return
  end
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
    return
  end
  if has_words_before() then
    cmp.complete()
    return
  end
  fallback()
end

local mapping = cmp.mapping.preset.insert({
  ['<C-j>'] = cmp.mapping.select_next_item(),
  ['<C-k>'] = cmp.mapping.select_prev_item(),
  ['<C-Space>'] = cmp.mapping.complete({}),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<Tab>'] = cmp.mapping(super_tab),
})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = mapping,
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'copilot' },
    { name = 'luasnip' },
    { name = 'cmp_tabnine' },
    { name = 'path' },
    { name = 'buffer' },
  }),
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
    ghost_text = true,
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      vim_item.menu = vim_item.kind .. '(' .. entry.source.name .. ')'
      vim_item.kind = require('lspkind').presets.default[vim_item.kind]
      return vim_item
    end,
  },
})
