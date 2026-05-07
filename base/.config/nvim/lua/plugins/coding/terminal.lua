return {

  {
    -- terminal
    'akinsho/toggleterm.nvim',
    opts = {
      size = 20,
      hide_numbers = true,
      open_mapping = [[<C-\>]],
      shade_filetypes = {},
      shade_terminals = false,
      shading_factor = 0.3,
      start_in_insert = true,
      persist_size = true,
      direction = 'horizontal',
      highlights = {
        NormalFloat = {
          link = 'NormalFloat',
        },
        FloatBorder = {
          guifg = '#181926',
          guibg = '#181926',
        },
      },
    },
    keys = {
      -- first class terminal
      { '<leader>ca', '<cmd>ToggleTerm direction=float<cr>', desc = 'Floating terminal' },
      { '<leader>ch', '<cmd>ToggleTerm size=10 direction=horizontal<cr>', desc = 'Horizontal terminal' },
      { '<leader>cv', '<cmd>ToggleTerm size=80 direction=vertical<cr>', desc = 'Vertical terminal' },
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
