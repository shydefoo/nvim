local M = {
	"fatih/vim-go",
	build = ":GoUpdateBinaries",
	config = function()
		vim.g.go_fmt_autosave = 0
		vim.g.go_rename_command = "gopls"
		vim.g.go_code_completion_enabled = 0
	end,
}

return M
