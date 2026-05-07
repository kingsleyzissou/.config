return {
  -- neotree
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  keys = {
    { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'NeoTree' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  deactivate = function()
    vim.cmd([[Neotree close]])
  end,
  opts = {
    enable_git_status = true,
    enable_diagnostics = true,
    open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' },
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
    },
    default_component_configs = {
      git_status = {
        symbols = {
          unstaged = '★',
          staged = '✓',
          untracked = '?',
          renamed = '➜',
          unmerged = '',
          deleted = '⊟',
        },
      },
    },
    event_handlers = {
      {
        event = 'file_opened',
        handler = function(_)
          require('neo-tree.command').execute({ action = 'close' })
        end,
      },
    },
  },
}
