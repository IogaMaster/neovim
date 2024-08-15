-- Most basic config
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.laststatus = 3
vim.cmd [[
    let g:loaded_netrw       = 1
    let g:loaded_netrwPlugin = 1
]]

-- Disable Mouse
vim.cmd [[
    set mouse=
]]

vim.cmd [[set undodir=~/.cache/vim/undodir]]

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
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

-- Neovide
if vim.g.neovide then
  vim.o.guifont = 'JetBrains Mono Nerd Font:h14'
  vim.g.neovide_cursor_vfx_mode = 'railgun'
end

