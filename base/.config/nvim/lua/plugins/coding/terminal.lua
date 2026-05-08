return {
  {
    -- terminal, just use the snacks terminal
    'folke/snacks.nvim',
    keys = {
      { '<leader>ca', function() Snacks.terminal.toggle() end, desc = 'Floating terminal' },
    },
    opts = {
      terminal = { enabled = true },
      styles = {
        terminal = {
          position = 'float',
          backdrop = 60,
          height = 0.9,
          width = 0.9,
          zindex = 50,
          border = false,
          keys = {
            q = 'hide',
            esc = { '<esc>', 'hide', mode = 'n' },
          },
        },
      },
    },
  },

  {
    -- execute commands in vim
    'is0n/jaq-nvim',
    keys = {
      { '<leader>ce', '<cmd>Jaq<cr>', desc = 'Execute file' },
      { '<leader>cx', '<cmd>!chmod +x %<cr>', desc = 'Make executable' },
    },
    opts = {
      cmds = {
        default = 'term',
        external = {
          typescript = 'bun run %',
          javascript = 'node %',
          python = 'python3 %',
          rust = 'cargo run',
          cpp = 'g++ % -o $fileBase && ./$fileBase',
          go = 'go run %',
          sh = 'sh %',
        },
        internal = {
          lua = 'luafile %',
        },
      },

      behavior = {
        default = 'terminal',
        startinsert = false,
        wincmd = false,
        autosave = false,
      },

      -- UI settings
      ui = {
        terminal = {
          position = 'vert',
          line_no = false,
          size = 60,
        },
      },
    },
  },
}
