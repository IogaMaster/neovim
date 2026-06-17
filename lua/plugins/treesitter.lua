return {
  'nvim-treesitter',
  lazy = false,
  pkgs = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  after = function()
    require('nvim-treesitter').setup {
      auto_install = true,
      highlight = { enable = true },
    }
    require("nvim-treesitter-textobjects").setup {
      select = {
        lookahead = true, -- Automatically jump forward to textobj
        include_surrounding_whitespace = false,
      },
    }
    vim.keymap.set({ "x", "o" }, "af", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
    end, { desc = "Around function" })

    vim.keymap.set({ "x", "o" }, "if", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
    end, { desc = "Inside function" })

    -- Class Selectors
    vim.keymap.set({ "x", "o" }, "ac", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
    end, { desc = "Around class" })

    vim.keymap.set({ "x", "o" }, "ic", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
    end, { desc = "Inside class" })
  end,
}
