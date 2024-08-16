return {
  'tint.nvim',
  before = function()
    deps.add { source = 'levouh/tint.nvim' }
  end,
  after = function()
    require('tint').setup()
  end,
}
