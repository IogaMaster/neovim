return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v1.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lua" },

		-- Snippets
		{ "L3MON4D3/LuaSnip" },
		{ "rafamadriz/friendly-snippets" },

		-- Esthetic
		{ "folke/trouble.nvim" },

		-- Misc
		{ "lukas-reineke/lsp-format.nvim" },
	},
	config = function()
		local lsp = require("lsp-zero")

		lsp.preset("recommended")
		lsp.nvim_workspace()
		lsp.set_preferences({
			sign_icons = {
				error = "",
				warn = "",
				hint = "",
				info = "",
			},
		})
		-- Configure Servers
		lsp.setup_servers({
			"lua_ls",
			"rnix",
			"rust_analyzer",
			"zls",
			"tsserver",
			"clangd",
		})
		lsp.on_attach(function(client, _)
			require("lsp-format").on_attach(client)
		end)
		lsp.setup()

		vim.opt.signcolumn = "yes" -- Disable lsp signals shifting buffer

		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
