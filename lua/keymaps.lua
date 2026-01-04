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

local function get_closer(chars)
  local openers = { ['('] = ')', ['['] = ']', ['{'] = '}', ['<'] = '>' }
  if #chars == 1 and openers[chars] then
    return openers[chars]
  end
  local reversed = chars:reverse()
  return reversed
    :gsub('[%(%[%{<]', function(m)
      return openers[m] or m
    end)
    :gsub('[%]%}%)>]', function(m)
      for k, v in pairs(openers) do
        if v == m then
          return k
        end
      end
      return m
    end)
end

vim.keymap.set('v', '<leader>ss', function()
  -- Prompt for the surround string (immediately handles any length)
  vim.ui.input({ prompt = 'Surround with: ' }, function(raw)
    if not raw or raw == '' then
      return
    end

    local left = vim.fn.escape(raw, [[/\]])
    local right = vim.fn.escape(get_closer(raw), [[/\]])

    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'nx', false)

    vim.schedule(function()
      local cmd = string.format([['<,'>s/\%%V\s*\zs\(\S.*\S\|\S\)\ze\s*\%%V/%s&%s/g]], left, right)
      pcall(vim.cmd, cmd)
    end)
  end)
end)

vim.keymap.set('v', '<leader>sS', function()
  vim.ui.input({ prompt = 'Surround with: ' }, function(raw)
    if not raw or raw == '' then
      return
    end

    local left = vim.fn.escape(raw, [[/\]])
    local right = vim.fn.escape(get_closer(raw), [[/\]])

    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'nx', false)

    vim.schedule(function()
      local cmd = string.format([['<,'>s/\%%V.*\%%V/%s&%s/]], left, right)
      pcall(vim.cmd, cmd)
    end)
  end)
end)
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
