return {
  'which-key.nvim',
  before = function()
    deps.add { source = 'folke/which-key.nvim' }
  end,
  after = function()
    require('which-key').setup()
  end,
}
