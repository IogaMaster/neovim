return {
  'reload',
  before = function()
    deps.add {
      source = 'IogaMaster/reload.nvim',
    }
  end,
  keys = {
    { '<leader>rr', '<cmd>reload<cr>', desc = 'Reload neovim' },
  },
  after = nil,
}
