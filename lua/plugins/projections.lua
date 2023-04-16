return {
	"gnikdroy/projections.nvim",
	lazy = false,
	keys = {
		{ "<leader>pp", "<cmd>Telescope projections<cr>", desc = "Open Project" },
	},
	config = function()
		require("projections").setup({
			workspaces = { "~/dev" },
			patterns = { ".git", ".svn", ".hg" },
			store_hooks = {
				pre = function()
					if pcall(require, "neo-tree") then
						vim.cmd([[tabd Neotree action=close]])
					end -- Close neotree on session end
				end,
			},
			cwd_target = {
				sidebar = "global",
			},
		})

		require("telescope").load_extension("projections")

		-- Autostore session on VimExit
		local Session = require("projections.session")
		vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
			callback = function()
				Session.store(vim.loop.cwd())
			end,
		})

		-- Switch to project if vim was started in a project dir
		local switcher = require("projections.switcher")
		vim.api.nvim_create_autocmd({ "VimEnter" }, {
			callback = function()
				if vim.fn.argc() == 0 then
					switcher.switch(vim.loop.cwd())
				end
			end,
		})
	end,
}
