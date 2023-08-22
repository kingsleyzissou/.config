return {
  {
    -- require explicitly
    'tpope/vim-obsession',
  },
  {
    -- session management
    'dhruvasagar/vim-prosession',
    dependencies = { 'tpope/vim-obsession' },
  },
}
