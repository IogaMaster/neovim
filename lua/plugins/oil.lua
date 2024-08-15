return {
    "oil",
    before = function() 
        deps.add({ 
            source = "stevearc/oil.nvim" 
        })
    end,
    keys = {
        { '<leader>fd', '<cmd>Oil<cr>', desc = 'File Browser' } 
    },
    after = function() 
        require('mini.icons').setup()
        require('oil').setup {
            skip_confirm_for_simple_edits = true,
        }
    end
}
