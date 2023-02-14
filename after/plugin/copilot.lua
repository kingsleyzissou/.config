vim.cmd([[
  imap <silent><script><expr> <a-y> copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true
]])
