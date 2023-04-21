local M = {
	"dense-analysis/ale",
	lazy = false,
	config = function()
		vim.g.ale_fixers = {
			lua = { "stylua" },
			sh = { "shfmt" },
			python = { "black" },
			go = { "gofmt" },
			json = { "jq" },
			terraform = { "terraform" },
			ruby = { "prettier", "rubocop", "rufo" },
		}
		vim.g.ale_linters = {
			javascript = { "eslint" },
			python = { "flake8" },
			go = { "golangci-lint" },
			sh = { "language_server", "shellcheck" },
			lua = { "luac" },
			terraform = { "tflint", "terraform_ls", "terraform" },
			ruby = { "rubocop" },
		}
		vim.g.ale_fix_on_save = 1
		vim.g.ale_lint_on_save = 0
		vim.g.ale_lint_on_insert_leave = 1
		vim.g["airline#extensions#ale#enabled"] = 1
		vim.g.ale_sign_error = "**"
		vim.g.ale_sign_warning = "*-"
		vim.g.ale_linters_explicit = 1
		vim.g.ale_set_signs = 1
		vim.g.ale_python_flake8_options = "--max-line-length=120"
		vim.g.ale_python_flake8_executable = "/Users/shide.foo/.pyenv/versions/3.7.8/bin/flake8"
		-- vim.g.ale_pattern_options = {
		-- 	[".py"] = { ale_enabled = 0 },
		-- 	[".go"] = { ale_enabled = 0 },
		-- 	[".lua"] = { ale_enabled = 0 },
		-- }
	end,
}
return M
