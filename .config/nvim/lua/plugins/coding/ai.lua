local ollama_host = os.getenv('OLLAMA_HOST') or 'localhost'
local ollama_port = '11434'
local ollama_key = 'TERM'
local ollama_model = 'deepseek-coder-v2'

local function ollama_endpoint(endpoint)
  return ollama_host .. ':' .. ollama_port .. endpoint
end

return {
  {
    'piersolenski/wtf.nvim',
    opts = {
      popup_type = 'vertical',
      provider = 'gemini',
      providers = {
        openai = {
          base_url = ollama_endpoint('/v1'),
          api_key = ollama_key,
          model_id = ollama_model,
        },
      },
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
          require('wtf').diagnose()
        end,
        desc = 'Debug diagnostic with AI',
      },
    },
  },
}
