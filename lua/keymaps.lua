vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('x', '<leader>p', [["_dP]]) -- paste WON'T copy
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<leader>w', '<C-w>')
vim.keymap.set('n', '<leader><Tab>', '<cmd>bnext<cr>')

vim.keymap.set('n', '<leader>rp', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>') -- Replace all instance of current word in file
vim.keymap.set('v', '<leader>rp', ':s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>') -- Replace all instance of current word in file

vim.keymap.set('v', '<leader>ss', function()
  local char = vim.fn.nr2char(vim.fn.getchar())
  local openers = { ['('] = ')', ['['] = ']', ['{'] = '}', ['<'] = '>' }
  local left, right = char, openers[char] or char

  vim.cmd 'normal! "sd'

  local content = vim.fn.getreg 's'
  if content:sub(-1) == '\n' then
    content = content:sub(1, -2)
  end
  local result = left .. content .. right
  vim.fn.setreg('s', result)
  vim.cmd 'normal! "sP'
end, { desc = 'Surround selection without newlines' })

-- Unset arrow keys
vim.cmd [[
    noremap <Left> <Nop>
    noremap <Right> <Nop>
    noremap <Up> <Nop>
    noremap <Down> <Nop>


    inoremap <Left> <Nop>
    inoremap <Right> <Nop>
    inoremap <Up> <Nop>
    inoremap <Down> <Nop>
]]

-- Disable Mouse
vim.cmd [[
    set mouse=
]]
