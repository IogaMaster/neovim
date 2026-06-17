return {
  'oil.nvim',
  lazy = false, -- telescope might need it
  pkgs = {
    'stevearc/oil.nvim',
    -- deps
    'nvim-mini/mini.nvim',
  },
  after = function()
    require('mini.icons').setup()
    require('oil').setup {
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
    }
  end,
  keys = {
    { '<leader>op', '<cmd>Oil<cr>', desc = 'oil' },
  },
}
