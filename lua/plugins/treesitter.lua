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
    deps.add {
      source = 'nvim-treesitter/nvim-treesitter-textobjects',
    }
  end,
  -- Use the new module name here
  config = function()
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
