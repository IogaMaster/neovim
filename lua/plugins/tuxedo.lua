return {
  'tuxedo',
  before = function()
    deps.add {
      source = 'IogaMaster/tuxedo.nvim',
    }
  end,
  keys = {
    { '<leader>tt', '<cmd>Tuxedo<cr>', desc = 'Task Management' },
  },
  after = nil,
}
