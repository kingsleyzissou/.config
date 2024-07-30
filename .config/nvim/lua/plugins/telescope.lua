local function dropdown(title)
  local themes = require('telescope.themes')
  return themes.get_dropdown({
    previewer = false,
    initial_mode = 'normal',
    prompt_title = title,
  })
end

return {
  {
    -- harpoon navigation
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    config = function()
      require('harpoon'):setup()
    end,
    keys = {
      {
        '<leader>ma',
        function()
          require('harpoon'):list():append()
        end,
        desc = 'Add mark',
      },
      {
        '<leader>mk',
        function()
          require('harpoon'):list():next()
        end,
        desc = 'Next mark',
      },
      {
        '<leader>mj',
        function()
          require('harpoon'):list():prev()
        end,
        desc = 'Previous mark',
      },
      {
        '<leader>mm',
        function()
          local harpoon = require('harpoon')
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'View marks',
      },
      {
        '<leader>m1',
        function()
          require('harpoon'):list():select(1)
        end,
        desc = 'Navigate to mark 1',
      },
      {
        '<leader>m2',
        function()
          require('harpoon'):list():select(2)
        end,
        desc = 'Navigate to mark 2',
      },
      {
        '<leader>m3',
        function()
          require('harpoon'):list():select(3)
        end,
        desc = 'Navigate to mark 3',
      },
      {
        '<leader>m4',
        function()
          require('harpoon'):list():select(4)
        end,
        desc = 'Navigate to mark 4',
      },
      {
        '<leader>mb',
        function()
          require('telescope.builtin').buffers(dropdown('Buffers'))
        end,
        desc = 'View buffers',
      },
    },
  },

  {
    -- telescope symbols
    'nvim-telescope/telescope-symbols.nvim',
  },

  {
    -- frequent/recent results
    'nvim-telescope/telescope-frecency.nvim',
    dependencies = { 'tami5/sqlite.lua' },
  },

  {
    -- telescope
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    lazy = false, -- this is required by too many plugins
    keys = {
      -- keybindings
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
      { '<leader>fe', '<cmd>Telescope symbols<cr>', desc = 'Find emoji' },
      { '<leader>ft', '<cmd>Telescope live_grep<cr>', desc = 'Find text' },
      { '<leader>fs', '<cmd>Telescope grep_string<cr>', desc = 'Find string' },
      { '<leader>fm', '<cmd>Telescope man_pages<cr>', desc = 'Find man pages' },
      { '<leader>fn', '<cmd>Telescope notify<cr>', desc = 'Find notifications' },
      { '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Find keymaps' },
      { '<leader>fo', '<cmd>Telescope oldfiles<cr>', desc = 'Find recent' },
      { '<leader>fT', '<cmd>TodoTelescope<cr>', desc = 'Find todos' },
      { '<leader>fp', '<cmd>Telescope projects<cr>', desc = 'Find projects' },
    },
    opts = function()
      return {
        defaults = {
          vimgrep_arguments = {
            'rg',
            '-L',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
          },
          prompt_prefix = '   ',
          selection_caret = '  ',
          entry_prefix = '  ',
          initial_mode = 'insert',
          selection_strategy = 'reset',
          sorting_strategy = 'ascending',
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          file_sorter = require('telescope.sorters').get_fuzzy_file,
          file_ignore_patterns = { 'node_modules', 'vendor' },
          generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
          path_display = { 'smart' },
          winblend = 0,
          border = {},
          borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
          color_devicons = true,
          set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
          file_previewer = require('telescope.previewers').vim_buffer_cat.new,
          grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
          qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
          -- Developer configurations: Not meant for general override
          buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
          mappings = {
            n = {
              ['q'] = require('telescope.actions').close,
              ['<c-d>'] = require('telescope.actions').delete_buffer,
            },
          },
        },
        extensions_list = {
          'frecency',
          'harpoon',
          'noice',
        },
      }
    end,
    config = function(_, options)
      local telescope = require('telescope')
      telescope.setup(options)

      -- load extensions
      for _, extension in ipairs(options.extensions_list) do
        telescope.load_extension(extension)
      end
    end,
  },
}
