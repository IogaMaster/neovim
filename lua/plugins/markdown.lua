return {
  'markview.nvim',
  pkgs = {
    'OXY2DEV/markview.nvim',
    -- deps
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
    'nvim-tree/nvim-web-devicons',
  },
  ft = "markdown",
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
