local M = {
	"dense-analysis/ale",
	lazy = false,
	config = function()
		vim.g.ale_fixers = {
			lua = { "stylua" },
			sh = { "shfmt" },
		}
		vim.g.ale_linters = {
			javascript = { "eslint" },
		}
		vim.g.ale_fix_on_save = 1
		vim.g.ale_lint_on_save = 0
		vim.g.ale_lint_on_insert_leave = 0
		vim.g["airline#extensions#ale#enabled"] = 1
		vim.g.ale_sign_error = "**"
		vim.g.ale_sign_warning = "*-"
		vim.g.ale_set_signs = 1
		-- vim.g.ale_pattern_options = {
		-- 	[".py"] = { ale_enabled = 0 },
		-- 	[".go"] = { ale_enabled = 0 },
		-- 	[".lua"] = { ale_enabled = 0 },
		-- }
	end,
}
return M
