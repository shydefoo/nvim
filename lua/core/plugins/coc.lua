local M = {
	"neoclide/coc.nvim",
	build = "yarn install",
	config = function()
		vim.g.coc_global_extensions = {
			"coc-pyright",
			"coc-go",
			"coc-yaml",
			"coc-json",
		}
	end,
} -- autocompletion, TODO: move to separate plugin

return M
