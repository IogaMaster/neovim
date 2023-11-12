return {
  'pwntester/octo.nvim',
  lazy = false,
  keys = {
    { '<leader>gh', ':Octo <Tab>', desc = 'Github' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = true,
}
