return {
  'gitsigns.nvim',
  pkgs = {
    'lewis6991/gitsigns.nvim',
  },
  event = "BufReadPost",
  after = function()
    require('gitsigns').setup {
      current_line_blame = true,
    }
  end,
}
