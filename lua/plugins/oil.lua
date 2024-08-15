return {
    "oil",
    before = MiniDeps.add({ 
        source = "stevearc/oil.nvim" 
    }), -- Install using mini.deps
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
