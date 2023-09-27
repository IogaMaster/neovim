return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<leader>fd', '<cmd>Oil<cr> <cmd>lua ', desc = 'File Browser' },
  },
  config = function()
    require('oil').setup()

    -- Auto Preview
    vim.api.nvim_create_autocmd('User', {
      pattern = 'OilEnter',
      callback = vim.schedule_wrap(function(args)
        local oil = require 'oil'
        if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
          oil.select { preview = true }
        end
      end),
    })
  end,
}
