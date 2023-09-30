vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.laststatus = 3
vim.cmd [[
    let g:loaded_netrw       = 1
    let g:loaded_netrwPlugin = 1
]]

-- These must be here for it to package with Nix.
require 'options'
require 'keymaps'

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
require('lazy').setup {
  import = 'plugins',
  dev = {
    path = '~/dev',
    fallback = true,
  },
}
