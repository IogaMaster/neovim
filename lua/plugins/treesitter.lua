return {
  'nvim-treesitter',
  before = function()
    deps.add {
      source = 'nvim-treesitter/nvim-treesitter',
      hooks = {
        post_checkout = function()
          vim.cmd 'TSUpdate'
        end,
      },
    }
  end,
  after = function()
    require('nvim-treesitter.configs').setup { auto_install = true, highlight = { enable = true } }
  end,
}
