return {
  'toggleterm.nvim',
  before = function()
    deps.add { source = 'akinsho/toggleterm.nvim' }
  end,
  keys = {
    { '<leader>ot', '<cmd>ToggleTerm<cr>', desc = 'Toggle Terminal' },
  },
  after = function()
    require('toggleterm').setup {}

    vim.cmd [[ tnoremap <Esc> <C-\><C-n> ]]
  end,
}
