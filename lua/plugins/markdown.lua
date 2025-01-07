return {
  'markview.nvim',
  lazy = false,
  before = function()
    deps.add {
      source = 'OXY2DEV/markview.nvim',
      depends = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
      },
    }
  end,
  after = function()
    local presets = require 'markview.presets'
    require('markview').setup {
      checkboxes = presets.checkboxes.nerd,
      headings = presets.headings.marker,
    }
  end,
}
