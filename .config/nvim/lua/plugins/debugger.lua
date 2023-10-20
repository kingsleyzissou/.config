local cmd = function(plugin, command)
  return function()
    require(plugin)[command]()
  end
end

return {
  {
    -- nvim-dap, debugger stuff
    'mfussenegger/nvim-dap',
    keys = {
      { '<leader>db', '<cmd>DapToggleBreakpoint<cr>', desc = 'Toggle breakpoint' },
      { '<leader>dr', cmd('dap', 'continue'), desc = 'Debug' },
    },
  },

  {
    'theHamsta/nvim-dap-virtual-text',
    config = true,
  },

  {
    -- ui for nvim-dap
    'rcarriga/nvim-dap-ui',
    requires = { 'mfussenegger/nvim-dap' },
    event = 'VeryLazy',
    keys = {
      { '<leader>dt', cmd('dapui', 'toggle'), desc = 'Toggle debugger' },
      { '<leader>do', cmd('dapui', 'open'), desc = 'Open debugger' },
      { '<leader>dc', cmd('dapui', 'close'), desc = 'Close debugger' },
    },
    config = true,
  },

  {
    -- go binding for nvim-dap
    'dreamsofcode-io/nvim-dap-go',
    requires = { 'mfussenegger/nvim-dap' },
    ft = 'go',
    config = true,
    keys = {
      { '<leader>dgt', cmd('dap-go', 'debug_test'), desc = 'Debug Go test' },
      { '<leader>dgl', cmd('dap-go', 'debug_last'), desc = 'Debug last Go test' },
    },
  },
}
