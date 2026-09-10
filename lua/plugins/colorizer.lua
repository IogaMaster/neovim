return {
  'nvim-colorizer.lua',
  pkgs = {
    'norcalli/nvim-colorizer.lua',
  },
  event = 'BufReadPost',
  after = function()
    require('colorizer').setup()
  end,
}
