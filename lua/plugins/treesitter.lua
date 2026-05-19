return {
  'nvim-treesitter',
  add = function()
    require('mini.deps').add {
      source = 'nvim-treesitter/nvim-treesitter',
      checkout = 'main',
      hooks = {
        post_checkout = function()
          vim.cmd 'TSUpdate'
        end,
      },
    }
  end,
  -- Use the new module name here
  config = function()
    require('nvim-treesitter').setup {
      auto_install = true,
      highlight = { enable = true },
    }
  end,
}
