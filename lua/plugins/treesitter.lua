return {
  'nvim-treesitter',
  lazy =false, -- nice to have this early
  pkgs = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  before = function()
    vim.cmd 'TSUpdate'
  end,
  after = function()
    require('nvim-treesitter').setup {
      auto_install = true,
      highlight = { enable = true },
    }
    require('nvim-treesitter.configs').setup {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
      },
    }
  end,
}
