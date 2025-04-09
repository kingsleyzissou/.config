local ollama_host = os.getenv('OLLAMA_HOST') or 'localhost'
local ollama_port = '11434'
local ollama_key = 'TERM'
local ollama_model = 'deepseek-coder-v2'

local function ollama_endpoint(endpoint)
  return ollama_host .. ':' .. ollama_port .. endpoint
end

return {
  {
    {
      -- virtual text autocomplete with local
      -- ollama model
      'milanglacier/minuet-ai.nvim',
      config = function()
        require('minuet').setup({
          virtualtext = {
            auto_trigger_ft = { '*' },
            auto_trigger_ignore_ft = { 'git', 'gitcommit' },
            show_on_completion_menu = true,
            keymap = {
              accept = '<A-a>',
              accept_line = '<A-A>',
              accept_n_lines = '<A-z>',
              prev = '<A-[>',
              next = '<A-]>',
              dismiss = '<A-e>',
            },
          },
          provider = 'openai_fim_compatible',
          n_completions = 1,
          context_window = 2048,
          provider_options = {
            openai_fim_compatible = {
              name = 'Ollama',
              api_key = ollama_key,
              end_point = ollama_endpoint('/v1/completions'),
              model = ollama_model,
              optional = {
                max_tokens = 56,
                top_p = 0.9,
              },
            },
          },
        })
      end,
    },
  },

  {
    -- use ollama to debug lsp warning + errors
    -- TODO: switch back to 'piersolenski/wtf.nvim'
    -- when this branch is merged into main
    'mike2194/wtf.nvim',
    opts = {
      popup_type = 'vertical',
      openai_api_base_url = ollama_endpoint('/v1/'),
      openai_api_key = ollama_key,
      openai_model_id = ollama_model,
      hooks = {
        -- these hooks show a spinner while the model
        -- is running
        request_started = function()
          vim.cmd('hi StatusLine ctermbg=NONE ctermfg=white')
        end,
        request_finished = function()
          vim.cmd('hi StatusLine ctermbg=NONE ctermfg=NONE')
        end,
      },
    },
    keys = {
      {
        '<leader>lw',
        mode = { 'x', 'n' },
        function()
          require('wtf').ai()
        end,
        desc = 'Debug diagnostic with AI',
      },
    },
  },

  {
    -- this plugin allows multiple other useful features like
    -- chatting, grammar improvements & code reviews
    'David-Kunz/gen.nvim',
    opts = {
      model = 'deepseek-coder-v2',
      show_model = true,
      host = ollama_host,
      port = ollama_port,
      display_mode = 'split',
    },
  },
}
