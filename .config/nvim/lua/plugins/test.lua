return {
  {
    -- neotest
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      -- adapters
      'nvim-neotest/neotest-go',
      'marilari88/neotest-vitest',
    },
    opts = {
      status = { virtual_text = true },
      output = { open_on_run = true },
      quickfix = {
        open = function()
          vim.cmd('Trouble quickfix')
        end,
      },
      icons = {
        expanded = '',
        child_prefix = '',
        child_indent = '',
        final_child_prefix = '',
        non_collapsible = '',
        collapsed = '',
        passed = '',
        running = '',
        failed = '',
        unknown = '',
      },
      log_level = vim.log.levels.DEBUG,
    },
    config = function(_, opts)
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace('neotest')
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
            return message
          end,
        },
      }, neotest_ns)

      opts.adapters = {
        require('neotest-vitest'),
        require('neotest-go'),
      }

      require('neotest').setup(opts)
    end,
    keys = {
      {
        '<leader>tr',
        function()
          require('neotest').run.run(vim.fn.expand('%'))
        end,
        desc = 'Run File',
      },
      {
        '<leader>tt',
        function()
          require('neotest').run.run(vim.fn.getcwd())
        end,
        desc = 'Run All Test Files',
      },
      {
        '<leader>tn',
        function()
          require('neotest').run.run()
        end,
        desc = 'Run Nearest',
      },
      {
        '<leader>to',
        function()
          require('neotest').summary.toggle()
          require('neotest').output_panel.toggle()
        end,
        desc = 'Toggle test output',
      },
      {
        '<leader>ts',
        function()
          require('neotest').run.stop()
        end,
        desc = 'Stop tests',
      },
    },
  },
}
