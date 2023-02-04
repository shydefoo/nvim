local M = {
	"neoclide/coc.nvim",
	build = "yarn install",
	dependencies = {
		{ "vim-airline/vim-airline-themes" },
	},
	config = function()
		vim.g.coc_global_extensions = {
			"coc-pyright",
			"coc-go",
			"coc-yaml",
			"coc-json",
			"coc-sumneko-lua",
			"coc-solargraph",
		}
		vim.g.coc_status_error_sign = ">>"
		vim.g.coc_status_warning_sign = ">-"
		vim.g["airline#extensions#coc#enabled"] = 1
		-- require("after.autoload.coc.ui")
	end,
}

return M
