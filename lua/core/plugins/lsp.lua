local M = {
	"neovim/nvim-lspconfig",
	enabled = true,
	dependencies = {
		"onsails/lspkind-nvim",
		{ "folke/neodev.nvim", config = true },
	},
	config = function()
		require("core.plugins.lsp.lsp")
	end,
}

return M
