return {
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
	},
	-- nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c", "lua", "vim", "help", "python", "go" },
				highlight = { enable = true },
				auto_install = true,
			})
		end,
	},
	-- session management
	{
		"folke/persistence.nvim",
		config = function()
			require("persistence").setup()
		end,
	},
}
