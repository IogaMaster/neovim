return {
  'tint.nvim',
  lazy = false,
  pkgs = {
    'levouh/tint.nvim',
  },
  after = function()
    require('tint').setup()
  end,
}
