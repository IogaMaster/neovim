return {
  'telescope.nvim',
  before = function()
    deps.add { source = 'nvim-telescope/telescope.nvim', depends = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' } }
    deps.add { source = 'nvim-telescope/telescope-file-browser.nvim', depends = { 'stevearc/oil.nvim' } }
    deps.add { source = 'mrcjkb/telescope-manix' }
    deps.add { source = 'IogaMaster/telescope-vim-pack.nvim' }
  end,
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files hidden=true<cr>', desc = 'Find Files' },
    { '<leader>fd', '<cmd>Telescope file_browser hidden=true<cr>', desc = 'Find Files' },
    { '<leader>fr', '<cmd>Telescope oldfiles hidden=true<cr>', desc = 'Recent Files' },
    { '<leader>ft', '<cmd>Telescope live_grep hidden=true<cr>', desc = 'Search Text in Files' },
    { '<leader>fg', '<cmd>Telescope git_status hidden=true<cr>', desc = 'Search List of changed files' },
    { '<leader>bi', '<cmd>Telescope buffers<cr>', desc = 'List Buffers' },
    { '<leader>pp', '<cmd>Telescope vimpack<cr>', desc = 'Manage Plugins' },
    { '<M-x>', '<cmd>Telescope commands<cr>', desc = 'Run Command' },
    { '<leader>fm', '<cmd>Telescope manix<cr>', desc = 'Search Nix Options and Utils' },
  },
  after = function()
    require('telescope').setup {
      extensions = {
        file_browser = {
          -- theme = 'dropdown',
          hijack_netrw = true,
          mappings = {
            ['n'] = {
              ['o'] = function(prompt_bufnr)
                local action_state = require 'telescope.actions.state'
                local current_picker = action_state.get_current_picker(prompt_bufnr)
                local entry = action_state.get_selected_entry()
                require('telescope.actions').close(prompt_bufnr)
                if entry then
                  require('oil').open(entry.path)
                else
                  require('oil').open(current_picker.cwd)
                end
              end,
            },
          },
        },
      },
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
