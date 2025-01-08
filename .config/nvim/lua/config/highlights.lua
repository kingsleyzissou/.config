local colors = require('catppuccin.palettes').get_palette()

vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#181926' })

-- Telescope Styles
-- https://www.reddit.com/r/neovim/comments/xcsatv/comment/iq32go0
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = colors.flamingo })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = colors.text, bg = colors.surface0, bold = true })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = colors.surface0, fg = colors.surface0 })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = colors.surface0 })
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { bg = colors.surface0 })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = colors.pink, bg = colors.mantle })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = colors.mantle, bg = colors.mantle })
vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = colors.mantle })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = colors.mantle })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { bg = colors.mantle, fg = colors.mantle })
vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = colors.mantle })
vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = colors.green, bg = colors.mantle })

-- vim.api.nvim_set_hl        -- NeotestBorder not implemented yet
vim.api.nvim_set_hl(0, 'NeotestAdapterName', { fg = colors.mauve })
vim.api.nvim_set_hl(0, 'NeotestDir', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'NeotestExpandMarker', { fg = colors.surface0 })
vim.api.nvim_set_hl(0, 'NeotestFailed', { fg = colors.red })
vim.api.nvim_set_hl(0, 'NeotestFile', { fg = colors.teal })
vim.api.nvim_set_hl(0, 'NeotestFocused', { bg = colors.mantle })
vim.api.nvim_set_hl(0, 'NeotestIndent', { fg = colors.flamingo })
vim.api.nvim_set_hl(0, 'NeotestNamespace', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'NeotestPassed', { fg = colors.green })
vim.api.nvim_set_hl(0, 'NeotestRunning', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'NeotestSkipped', { fg = colors.subtext })
