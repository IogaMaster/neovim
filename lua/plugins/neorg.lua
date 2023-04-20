return {
  'nvim-neorg/neorg',
  build = ':Neorg sync-parsers',
  dependencies = { { 'nvim-lua/plenary.nvim' }, { 'nvim-neorg/neorg-telescope' } },
  opts = {
    load = {
      ['core.defaults'] = {}, -- Loads default behaviour
      ['core.norg.concealer'] = {}, -- Adds pretty icons to your documents
      ['core.integrations.telescope'] = {},
      ['core.norg.dirman'] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = '~/Documents/notes',
          },
        },
      },
    },
  },
}
