return {
  'nvim-colorizer.lua',
  before = function()
    deps.add {
      source = 'norcalli/nvim-colorizer.lua',
    }
  end,
  after = function()
    require('colorizer').setup()
  end,
}
