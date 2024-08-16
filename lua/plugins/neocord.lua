return {
  'neocord',
  before = function()
    deps.add { source = 'IogaMaster/neocord' }
  end,
  after = function()
    require('neocord').setup {
      logo = 'https://raw.githubusercontent.com/IogaMaster/neovim/main/.github/assets/nixvim-dark.webp',
    }
  end,
}
