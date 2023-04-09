return {
    'akinsho/toggleterm.nvim',
    lazy = false,
    keys = {
        { '<leader>ot', '<cmd>ToggleTerm<cr>', desc = 'Toggle Term' },
    },
    config = function()
        require('toggleterm').setup {
            size = 15,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = '1',
            start_in_insert = true,
            persist_size = true,
            direction = 'horizontal'
        }
    end,
}
