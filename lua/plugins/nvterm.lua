return {
  'NvChad/nvterm',
  keys = {
    { '<leader>ot', '<cmd>lua require("nvterm.terminal").toggle "horizontal"<cr>', desc = 'Toggle Terminal' },
  },
  config = function()
    require('nvterm').setup()
  end,
}
