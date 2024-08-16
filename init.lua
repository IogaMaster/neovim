-- Bootstrap mini.deps
local path_package = vim.fn.stdpath 'data' .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd 'echo "Installing `mini.nvim`" | redraw'
  local clone_cmd = {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim',
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd 'packadd mini.nvim | helptags ALL'
  vim.cmd 'echo "Installed `mini.nvim`" | redraw'
end
require('mini.deps').setup { path = { package = path_package } }
deps = MiniDeps

-- Install lz.n (lazy loading api)
deps.add { source = 'nvim-neorocks/lz.n' }

-- These must be here for it to package with Nix.
require 'options'
require 'keymaps'
require 'colorscheme'

-- Enable mini plugins
require('mini.pairs').setup()
require('mini.align').setup()
require('mini.basics').setup()
require('mini.jump').setup()
require('mini.cursorword').setup()

-- Load all plugins
require('lz.n').load 'plugins'
