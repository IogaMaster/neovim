return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = false,
  cmd = 'Neotree',
  branch = 'v2.x',
  keys = {
    { '<leader>op', '<cmd>Neotree toggle<cr>', desc = 'NeoTree' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = {
    filesystem = {
      follow_current_file = true,
      hijack_netrw_behavior = 'open_default',
      filtered_items = {
        visible = true,
      },
      use_libuv_file_watcher = true,
    },
    git_status = {
      symbols = {
        -- Change type
        added = '✚',
        deleted = '✖',
        modified = '',
        renamed = '',
        -- Status type
        untracked = '',
        ignored = '',
        unstaged = '',
        staged = '',
        conflict = '',
      },
    },
  },
}
