local M = {
	"jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("core.plugins.lsp.null-ls")
	end,
}

return M
