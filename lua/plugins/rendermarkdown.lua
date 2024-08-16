return {
  'render-markdown.nvim',
  before = function()
    deps.add { source = 'MeanderingProgrammer/render-markdown.nvim' }
  end,
  ft = 'markdown',
  after = function()
    require('render-markdown').setup {}
  end,
}
