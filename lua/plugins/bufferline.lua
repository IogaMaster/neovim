return {
  'bufferline.nvim',
  lazy = false,
  pkgs = {
    'akinsho/bufferline.nvim',
    -- Deps
    'nvim-tree/nvim-web-devicons',
  },
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
