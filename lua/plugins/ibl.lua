return {
  'indent-blankline.nvim',
  event = 'BufReadPost',
  pkgs = {
    'lukas-reineke/indent-blankline.nvim',
  },
  after = function()
    require('ibl').setup()
  end,
}
