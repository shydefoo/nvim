local M = {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" }, -- TODO: test
	config = function()
		require("todo-comments").setup()
	end,
}

return M
