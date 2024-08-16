return {
  'telescope.nvim',
  before = function()
    deps.add { source = 'nvim-telescope/telescope.nvim', depends = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' } }
    deps.add { source = 'mrcjkb/telescope-manix' }
  end,
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
    { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Recent Files' },
    { '<leader>ft', '<cmd>Telescope live_grep<cr>', desc = 'Search Text in Files' },
    { '<leader>bi', '<cmd>Telescope buffers<cr>', desc = 'List Buffers' },
    { '<M-x>', '<cmd>Telescope commands<cr>', desc = 'Run Command' },
    { '<leader>fm', '<cmd>Telescope manix<cr>', desc = 'Search Nix Options and Utils' },
  },
  after = function()
    require('telescope').setup {
      defaults = {
        prompt_prefix = '   ',
        selection_caret = '  ',
        initial_mode = 'normal',
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        path_display = { 'truncate' },
        winblend = 0,
        -- border = {},
        borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
        color_devicons = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        -- Keymaps
        mappings = {
          n = {
            ['d'] = require('telescope.actions').delete_buffer,
          },
        },
      },
    }
  end,
}
