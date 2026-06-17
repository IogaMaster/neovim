return {
  'todo-comments.nvim',
  event = 'BufReadPost',
  pkgs = {
    'folke/todo-comments.nvim',
    'nvim-lua/plenary.nvim',
  },
  after = function()
    require('todo-comments').setup()
  end,
}
