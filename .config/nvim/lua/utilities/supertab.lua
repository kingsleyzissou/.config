local check_backspace = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  end
  return false
end

return function(reverse)
  local cmp = require('cmp')
  local luasnip = require('luasnip')
  return function(fallback)
    if cmp.visible() then
      if reverse == -1 then
        cmp.select_prev_item()
        return
      end
      cmp.select_next_item()
      return
    end
    if luasnip.jumpable() then
      luasnip.jump(reverse)
      return
    end
    if reverse == -1 then
      fallback()
      return
    end
    if luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
      return
    end
    if luasnip.expandable() then
      luasnip.expand()
      return
    end
    if check_backspace() then
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<tab>', true, true, true), 'n')
      return
    end
    fallback()
  end
end
