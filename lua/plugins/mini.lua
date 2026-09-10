return {
  'mini.nvim',
  lazy = false, -- was in init.lua
  pkgs = {
    'nvim-mini/mini.nvim',
  },
  after = function()
    require('mini.pairs').setup()
    require('mini.align').setup()
    require('mini.basics').setup()
    require('mini.jump').setup()
    require('mini.cursorword').setup()
  end,
}
