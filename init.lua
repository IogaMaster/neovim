vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.laststatus = 3
vim.cmd [[
    let g:loaded_netrw       = 1
    let g:loaded_netrwPlugin = 1
]]

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup 'plugins'

-- Keymaps
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('x', '<leader>p', [["_dP]]) -- paste WON'T copy
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<leader>w', '<C-w>')
vim.keymap.set('n', '<leader><Tab>', '<cmd>bnext<cr>')

-- Unset arrow keys
vim.cmd [[
    noremap <Left> <Nop>
    noremap <Right> <Nop>
    noremap <Up> <Nop>
    noremap <Down> <Nop>
]]

-- Disable Mouse
vim.cmd [[
    set mouse=
]]

-- Settings
vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'
vim.opt.updatetime = 50
vim.opt.clipboard = 'unnamedplus'
