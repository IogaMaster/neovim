return {
  'reload',
  pkgs = {
    'IogaMaster/reload.nvim',
  },
  keys = {
    { '<leader>rr', '<cmd>Reload<cr>', desc = 'Reload neovim' },
  },
  cmd = 'Reload',
  after = function()
    require('reload').setup()
  end,
}
