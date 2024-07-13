local M = {
	"nvimtools/none-ls.nvim",
    event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
        "nvimtools/none-ls-extras.nvim",
        "gbprod/none-ls-shellcheck.nvim"
	},
	config = function()
		require("core.plugins.lsp.null-ls")
	end,
}

return M
