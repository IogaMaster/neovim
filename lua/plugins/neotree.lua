return {
  'neo-tree.nvim',
  lazy = false,
  pkgs = {
    'nvim-neo-tree/neo-tree.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>op', '<cmd>Neotree toggle<cr>', desc = 'NeoTree' },
  },

  after = function()
    require('neo-tree').setup {
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = 'open_default',
        filtered_items = { visible = true },
        use_libuv_file_watcher = true,
      },
      git_status = {
        symbols = {
          -- Change type
          added = '✚', -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = '✖', -- this can only be used in the git_status source
          renamed = '󰁕', -- this can only be used in the git_status source
          -- Status type
          untracked = '',
          ignored = '',
          unstaged = '󰄱',
          staged = '',
          conflict = '',
        },
      },
    }
    -- Neotree does not work when saving sessions, so close it, makes reload.nvim work
    vim.api.nvim_create_autocmd('SessionLoadPost', {
      callback = function()
        vim.schedule(function()
          vim.cmd [[
            silent! bwipeout! neo-tree*
            silent! bwipeout! *neo-tree*
          ]]
        end)
      end,
    })
  end,
}
