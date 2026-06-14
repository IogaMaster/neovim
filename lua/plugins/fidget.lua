return {
  'fidget.nvim',
  before = function()
    deps.add { source = 'folke/which-key.nvim' }
  end,
  after = function()
    require('fidget').setup {
      notification = {
        override_vim_notify = true,
      },
    }
  end,
}
