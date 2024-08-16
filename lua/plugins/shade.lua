return {
  'shade.nvim',
  before = function()
    deps.add { source = 'sunjon/shade.nvim' }
  end,
  after = function()
    require('shade').setup {
      overlay_opacity = 40,
      opacity_step = 1,
    }
  end,
}
