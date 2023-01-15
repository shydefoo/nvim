return {
	{ "neoclide/coc.nvim", build = "yarn install" }, -- autocompletion, TODO: move to separate plugin
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},
	{ "tpope/vim-fugitive", lazy = false }, -- git plugin
	-- ale
	{
		"dense-analysis/ale",
		lazy = false,
		config = function()
			vim.g.ale_fixers = { lua = { "stylua" } }
			vim.g.ale_fix_on_save = 1
			vim.g.ale_lint_on_save = 1
			vim.g.ale_lint_on_insert_leave = 0
		end,
		keys = {
			{ "<leader>fx", "<cmd>ALEFix<cr>", desc = "ale fix" },
			{ "<leader>fl", "<cmd>ALELint<cr>", desc = "ale lint" },
		},
	}, -- ale
}
