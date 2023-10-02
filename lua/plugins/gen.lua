return {
  'David-Kunz/gen.nvim',
  config = function()
    vim.keymap.set('v', '<leader>ai', ':Gen<CR>')
    vim.keymap.set('n', '<leader>ai', ':Gen<CR>')
  end,
}
