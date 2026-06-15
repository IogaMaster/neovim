return {
  'nvim-biscuits',
  before = function()
    deps.add { source = 'code-biscuits/nvim-biscuits', depends = { 'nvim-treesitter/nvim-treesitter' } }
  end,
  after = function()
    require('nvim-biscuits').setup {
      cursor_line_only = true,
      default_config = {
        min_distance = 5,
      },
    }
  end,
}
