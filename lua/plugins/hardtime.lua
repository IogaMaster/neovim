return {
  'hardtime.nvim',
  before = function()
    deps.add {
      source = 'm4xshen/hardtime.nvim',
      depends = {
        'MunifTanjim/nui.nvim',
      },
    }
  end,
  after = function()
    require('hardtime').setup()
  end,
}
