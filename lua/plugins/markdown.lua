return {
  'markview.nvim',
  lazy = false,
  before = function()
    deps.add {
      source = 'OXY2DEV/markview.nvim',
      depends = {
        { source = 'nvim-treesitter/nvim-treesitter', checkout = 'main' },
        'nvim-tree/nvim-web-devicons',
      },
    }
  end,
  after = function()
    require('nvim-treesitter').setup {
      auto_install = true,
      highlight = { enable = true },
    }

    local presets = require 'markview.presets'
    require('markview').setup {
      checkboxes = presets.checkboxes.nerd,
      headings = presets.headings.marker,
      code_blocks = {
        enable = true,
        style = 'language', -- Ensures it looks for the lang tag
      },
    }
  end,
}
