return {
  'bufferline.nvim',

  before = function()
    deps.add { source = 'akinsho/bufferline.nvim', depends = { 'nvim-tree/nvim-web-devicons' } }
  end,
  after = function()
    require('bufferline').setup {
      options = {
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'NeoTree',
            text_align = 'left',
            separator = true,
          },
        },
      },
    }
  end,
}
