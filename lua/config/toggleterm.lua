require("toggleterm").setup()
vim.cmd [[ tnoremap <Esc> <C-\><C-n> ]]

vim.keymap.set('n', '<leader>ot', '<cmd>ToggleTerm<cr>')
