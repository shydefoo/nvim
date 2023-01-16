local M = {
	"dense-analysis/ale",
	lazy = false,
	config = function()
		vim.g.ale_fixers = { lua = { "stylua" } }
		vim.g.ale_fix_on_save = 1
		vim.g.ale_lint_on_save = 1
		vim.g.ale_lint_on_insert_leave = 0
	end,
}
return M
