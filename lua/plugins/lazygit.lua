return {
  'lazygit',
  before = function()
    deps.add {
      source = 'kdheepak/lazygit.nvim',
    }
  end,
  keys = {
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Git' },
  },
  after = nil,
}
