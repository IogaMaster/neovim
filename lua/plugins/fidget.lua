return {
  'fidget.nvim',
  pkgs = { 'j-hui/fidget.nvim' },
  lazy = false,
  after = function()
    require('fidget').setup {
      notification = {
        override_vim_notify = true,
      },
    }
  end,
}
