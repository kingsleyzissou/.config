return {
  {
    'monaqa/dial.nvim',
    -- stylua: ignore
    keys = {
      { '<leader>.', function() return require('dial.map').inc_normal('default') end, expr = true, desc = 'Increment', mode = { 'n' } },
      { '<leader>,', function() return require('dial.map').dec_normal('default') end, expr = true, desc = 'Decrement', mode = { 'n' } },
      { '<leader>.', function() return require('dial.map').inc_visual('default') end, expr = true, desc = 'Increment', mode = { 'v' } },
      { '<leader>,', function() return require('dial.map').dec_visual('default') end, expr = true, desc = 'Decrement', mode = { 'v' } },
    },
    opts = function()
      local augend = require('dial.augend')
      return {
        default = {
          augend.constant.new({
            elements = { '&&', '||' },
            word = false,
            cyclic = true,
          }),
          augend.integer.alias.decimal,
          augend.integer.alias.decimal_int,
          augend.integer.alias.hex,
          augend.hexcolor.new({
            case = 'lower',
          }),
          augend.date.alias['%d/%m/%Y'],
          augend.date.alias['%Y/%m/%d'],
          augend.constant.new({
            elements = {
              'True',
              'False',
            },
            word = true,
            cyclic = true,
          }),
          augend.semver.alias.semver,
          augend.constant.alias.bool,
        },
      }
    end,
    config = function(_, opts)
      require('dial.config').augends:register_group(opts)
    end,
  },
}
