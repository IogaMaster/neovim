return {
  'indent-blankline.nvim',
  before = function()
    deps.add {
      source = 'lukas-reineke/indent-blankline.nvim',
    }
  end,
  after = function()
    require('ibl').setup()
  end,
}
