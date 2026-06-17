return {
  'which-key.nvim',
  lazy = false, -- neven know when yoy need it
  pkgs = {
    'folke/which-key.nvim',
  },
  after = function()
    require('which-key').setup()
  end,
}
