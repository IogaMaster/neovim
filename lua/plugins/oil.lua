return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<leader>fd', '<cmd>Oil<cr> <cmd>lua ', desc = 'File Browser' },
  },
  config = function()
    require('oil').setup {
      skip_confirm_for_simple_edits = true,
    }
  end,
}
