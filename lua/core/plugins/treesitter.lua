local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local settings = require("core.settings")
		require("nvim-treesitter.configs").setup({
			ensure_installed = settings.treesitter_ensure_installed,
			highlight = { enable = true },
			auto_install = true,
		})
	end,
}
return M
