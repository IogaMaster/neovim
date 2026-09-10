return {
  'toggleterm.nvim',
  pkgs = {
    'akinsho/toggleterm.nvim',
  },
  keys = {
    { '<leader>ot', '<cmd>ToggleTerm<cr>', desc = 'Toggle Terminal' },
  },
  after = function()
    require('toggleterm').setup {}

    vim.cmd [[ tnoremap <Esc> <C-\><C-n> ]]
  end,
}
