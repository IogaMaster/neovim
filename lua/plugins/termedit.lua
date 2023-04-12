return {
    'chomosuke/term-edit.nvim',
    lazy = false, -- or ft = 'toggleterm' if you use toggleterm.nvim
    version = '1.*',
    config = function()
        require("term-edit").setup {
            prompt_end = '> ',
        }
    end
}
