return {
  'quicker.nvim',
  lazy = false, -- was in init.lua
  pkgs = {
    'stevearc/quicker.nvim',
  },
  after = function()
    require('quicker').setup()
  end,
}
