return {
  'oil',
  lazy = false,
  before = function()
    deps.add {
      source = 'stevearc/oil.nvim',
    }
    require('mini.icons').setup()
    require('oil').setup {
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
    }
  end,
}
