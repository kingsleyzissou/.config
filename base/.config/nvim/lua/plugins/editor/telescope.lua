local extensions = {
  'frecency',
  'harpoon',
  'noice',
  'ui-select',
}

local rg = {
  'rg',
  '-L',
  '--color=never',
  '--no-heading',
  '--with-filename',
  '--line-number',
  '--column',
  '--smart-case',
  '--hidden',
}

return {
  {
    -- frequent/recent results
    'nvim-telescope/telescope-frecency.nvim',
    dependencies = { 'tami5/sqlite.lua' },
  },

  {
    -- ui selecter!
    'nvim-telescope/telescope-ui-select.nvim',
  },

  {
    -- telescope
    'nvim-telescope/telescope.nvim',
    lazy = false, -- this is required by too many plugins
    keys = {
      -- keybindings
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
      { '<leader>ft', '<cmd>Telescope live_grep<cr>', desc = 'Find text' },
      { '<leader>fs', '<cmd>Telescope grep_string<cr>', desc = 'Find string under cursor' },
      { '<leader>fm', '<cmd>Telescope man_pages<cr>', desc = 'Find man pages' },
      { '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Find keymaps' },
    },
    opts = {
      defaults = {
        borderchars = {
          prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
          results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
          preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        },
        vimgrep_arguments = rg,
        prompt_prefix = '   ',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            width = {
              padding = 0,
            },
            height = {
              padding = 0,
            },
          },
        },
        file_ignore_patterns = { 'vendor' },
        mappings = {
          n = {
            ['<c-x>'] = require('telescope.actions').delete_buffer,
            ['<c-del>'] = require('telescope.actions').delete_buffer,
          },
        },
      },
      extensions_list = function(_, opts)
        for _, ext in ipairs(extensions) do
          table.insert(opts.extensions_list, ext)
          require('telescope').load_extension(ext)
        end
        return extensions
      end,
    },
  },
}
