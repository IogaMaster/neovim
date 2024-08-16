return {
  'gitsigns.nvim',
  before = function()
    deps.add {
      source = 'lewis6991/gitsigns.nvim',
    }
  end,
  after = function()
    require('gitsigns').setup {
      current_line_blame = true,
    }
  end,
}
