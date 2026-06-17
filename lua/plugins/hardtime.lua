return {
  'hardtime.nvim',
  lazy = false,
  pkgs = {
    'm4xshen/hardtime.nvim',
    'MunifTanjim/nui.nvim', -- dep
  },
  after = function()
    require('hardtime').setup()
  end,
}
