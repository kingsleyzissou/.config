return {
  {
    -- needed by neotest, require explicitly
    'antoinemadec/FixCursorHold.nvim',
  },

  {
    -- neotest
    -- TODO: fix colorscheme
    'nvim-neotest/neotest',
    dependencies = {
      -- implicit require
      'nvim-neotest/neotest-go',
      'nvim-neotest/neotest-jest',
      -- other dependencies
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
    },
    opts = {
      status = { virtual_text = true },
      output = { open_on_run = true },
      quickfix = {
        open = function()
          vim.cmd('Trouble quickfix')
        end,
      },
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
        require('neotest-jest'),
        require('neotest-go'),
      }

      require('neotest').setup(opts)
    end,
    -- stylua: ignore
    keys = {
      { '<leader>dt', function() require('neotest').run.run(vim.fn.expand('%')) end, desc = 'Run File' },
      { '<leader>dT', function() require('neotest').run.run(vim.loop.cwd()) end, desc = 'Run All Test Files' },
      { '<leader>dr', function() require('neotest').run.run() end, desc = 'Run Nearest' },
      { '<leader>ds', function() require('neotest').summary.toggle() end, desc = 'Toggle Summary' },
      { '<leader>do', function() require('neotest').output.open({ enter = true, auto_close = true }) end, desc = 'Show Output' },
      { '<leader>dO', function() require('neotest').output_panel.toggle() end, desc = 'Toggle Output Panel' },
      { '<leader>dS', function() require('neotest').run.stop() end, desc = 'Stop' },
    },
  },
}
