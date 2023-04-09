vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('x', '<leader>p', [["_dP]]) -- paste WON'T copy
vim.keymap.set('n', 'Q', '<nop>')

vim.keymap.set('n', '<leader>w', '<C-w>')
