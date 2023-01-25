local M = {
	"pwntester/octo.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		{ "kyazdani42/nvim-web-devicons", name = "kyazdani42-nvim-web-devicons" },
	},
	config = function()
		require("octo").setup({
			always_select_remote = "true",
		})
	end,
}

return M
