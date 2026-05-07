local function dropdown_opts(opts)
  local themes = require('telescope.themes')
  return themes.get_dropdown({
    borderchars = {
      prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    },
    previewer = false,
    initial_mode = 'insert',
    prompt_title = opts.title,
    layout_strategy = 'horizontal',
  })
end

local function picker(paths, opts)
  local conf = require('telescope.config').values
  require('telescope.pickers')
    .new(opts, {
      finder = require('telescope.finders').new_table({
        results = paths,
      }),
      sorter = conf.generic_sorter({}),
    })
    :find()
end

return {

  {
    -- harpoon navigation
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    config = function()
      require('harpoon'):setup()
    end,
    -- stylua: ignore
    keys = {
      { '<leader>ma', function() require('harpoon'):list():add() end, desc = 'Add mark' },
      { '<leader>mk', function() require('harpoon'):list():next() end, desc = 'Next mark' },
      { '<leader>mj', function() require('harpoon'):list():prev() end, desc = 'Previous mark' },
      { '<leader>m1', function() require('harpoon'):list():select(1) end, desc = 'Navigate to mark 1' },
      { '<leader>m2', function() require('harpoon'):list():select(2) end, desc = 'Navigate to mark 2' },
      { '<leader>m3', function() require('harpoon'):list():select(3) end, desc = 'Navigate to mark 3' },
      { '<leader>m4', function() require('harpoon'):list():select(4) end, desc = 'Navigate to mark 4' },
      {
        '<leader>mm',
        function()
          local file_paths = {}
          for _, item in ipairs(require('harpoon'):list().items) do
            table.insert(file_paths, item.value)
          end
          local opts = dropdown_opts('Harpoon')
          picker(file_paths, opts)
        end,
        desc = 'View marks',
      },
      {
        '<leader>mb',
        function()
          local opts = dropdown_opts({ title = 'buffers' })
          require('telescope.builtin').buffers(opts)
        end,
        desc = 'View buffers',
      },
    },
  },
}
