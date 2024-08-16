return {
  'staline.nvim',

  before = function()
    deps.add { source = 'tamton-aquib/staline.nvim', depends = { 'nvim-tree/nvim-web-devicons' } }
  end,
  after = function()
    require('staline').setup {
      defaults = {
        left_separator = ' ',
        right_separator = '  ',
        branch_symbol = ' ',
        mod_symbol = '',
        line_column = '[%l/%L]',
      },
      mode_icons = {
        ['n'] = 'NORMAL',
        ['no'] = 'NORMAL',
        ['nov'] = 'NORMAL',
        ['noV'] = 'NORMAL',
        ['niI'] = 'NORMAL',
        ['niR'] = 'NORMAL',
        ['niV'] = 'NORMAL',
        ['i'] = 'INSERT',
        ['ic'] = 'INSERT',
        ['ix'] = 'INSERT',
        ['s'] = 'INSERT',
        ['S'] = 'INSERT',
        ['v'] = 'VISUAL',
        ['V'] = 'VISUAL',
        [''] = 'VISUAL',
        ['r'] = 'REPLACE',
        ['r?'] = 'REPLACE',
        ['R'] = 'REPLACE',
        ['c'] = 'COMMAND',
        ['t'] = 'TERMINAL',
      },
      special_table = {
        lazy = { 'Plugins', '💤 ' },
        TelescopePrompt = { 'Telescope', '  ' },
      },
      sections = {
        left = { '-mode', ' ', 'branch' },
        mid = { 'lsp_name' },
        right = { 'file_name', 'line_column' },
      },
    }

    vim.cmd [[ 
        set noshowmode 
    ]]
  end,
}
