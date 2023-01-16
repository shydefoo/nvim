local M = {
	"neoclide/coc.nvim",
	build = "yarn install",
	config = function()
		vim.g.coc_global_extensions = {
			"coc-pyright",
			"coc-go",
			"coc-yaml",
			"coc-json",
			"coc-lua",
		}
		vim.g.coc_status_error_sign = ">>"
		vim.g.coc_status_warning_sign = ">-"
		vim.g["airline#extensions#coc#enabled"] = 1
	end,
} -- autocompletion, TODO: move to separate plugin

return M
