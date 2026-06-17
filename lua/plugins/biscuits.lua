return {
  'biscuits',
  pkgs = {
    'code-biscuits/nvim-biscuits',
    -- Deps
    'nvim-treesitter/nvim-treesitter',
  },
  event = 'BufReadPost',
  after = function()
    require('nvim-biscuits').setup {
      cursor_line_only = true,
      default_config = {
        min_distance = 5,
      },
    }
  end,
}
