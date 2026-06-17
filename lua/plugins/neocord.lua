return {
  'neocord',
  lazy = false,
  pkgs = {
    'IogaMaster/neocord',
  },
  after = function()
    require('neocord').setup {
      logo = 'https://raw.githubusercontent.com/IogaMaster/neovim/main/.github/assets/nixvim-dark.webp',
    }
  end,
}
