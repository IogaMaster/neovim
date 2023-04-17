return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			color_overrides = {
				all = {
					base = "#11111b",
				},
			},
		})
		vim.cmd([[colorscheme catppuccin-mocha]])
	end,
}
