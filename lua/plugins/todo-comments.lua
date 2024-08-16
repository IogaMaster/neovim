return {
  'todo-comments.nvim',
  before = function()
    deps.add { source = 'folke/todo-comments.nvim', depends = { 'nvim-lua/plenary.nvim' } }
  end,
  after = function()
    require('todo-comments').setup()
  end,
}
