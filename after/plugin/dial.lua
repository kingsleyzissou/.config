local dial = require('dial.map')
local augend = require('dial.augend')

require('dial.config').augends:register_group({
    visual = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias['%Y/%m/%d'],
        augend.constant.alias.alpha,
        augend.constant.alias.Alpha,
        augend.hexcolor.new({
            case = 'lower',
        }),
    },
    custom = {
        augend.constant.new({
            elements = { 'and', 'or' },
            word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
            cyclic = true, -- "or" is incremented into "and".
        }),
        augend.constant.new({
            elements = { '&&', '||' },
            word = false,
            cyclic = true,
        }),
        augend.constant.new({
            elements = { 'True', 'False' },
            word = true,
            cyclic = true,
        }),
        augend.constant.new({
            elements = { 'true', 'false' },
            word = true,
            cyclic = true,
        }),
        augend.hexcolor.new({
            case = 'lower',
        }),
        augend.date.alias['%d/%m/%Y'], -- date (02/19/2022, etc.)
        augend.date.alias['%Y/%m/%d'], -- date (02/19/2022, etc.)
        augend.constant.alias.bool, -- boolean value (true <-> false)
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.semver.alias.semver,
    },
})

-- keybindings
local map = vim.keymap.set
map('n', '<leader>,', dial.dec_normal('custom'), { desc = 'Decrement' })
map('n', '<leader>.', dial.inc_normal('custom'), { desc = 'Increment' })
map('v', '<leader>,', dial.dec_normal('visual'), { desc = 'Decrement' })
map('v', '<leader>.', dial.inc_normal('visual'), { desc = 'Increment' })
