local wk = require("which-key")
return {
	-- file explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				open_on_setup = true,
				open_on_setup_file = true,
				sort_by = "case_sensitive",
				view = {
					side = "right",
					mappings = {
						list = {
							{ key = "u", action = "dir_up" },
							{ key = "s", action = "vsplit" },
							{ key = "v", action = "split" },
							{ key = "i", action = "split" },
							{ key = "t", action = "tabnew" },
							{ key = "ma", action = "create" },
							{ key = "md", action = "remove" },
							{ key = "mD", action = "trash" },
							{ key = "mm", action = "rename" },
							{ key = "mr", action = "system_open" },
							{ key = "C", action = "cd" },
						},
					},
				},
				renderer = { group_empty = true },
				filters = { dotfiles = true },
			})
			wk.register({
				n = {
					name = "file", -- optional group name
					n = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
					f = { "<cmd>NvimTreeFindFile<cr>", "Find file in tree" },
					e = "Edit File", -- same as above
				},
			}, { prefix = "<leader>" })
		end,
		lazy = false,
	},
	-- comment out code with gc
	{ "tpope/vim-commentary" },
	-- fuzzy finder
	{
		"junegunn/fzf.vim",
		lazy = false,
		keys = { { "<leader>f", "<cmd>Files<cr>", desc = "fzf" } },
		dependencies = { "junegunn/fzf" },
	},
	{ "jiangmiao/auto-pairs" }, -- autocomplete for parenthesis, brackets, etc
	{ "yuttie/comfortable-motion.vim" }, -- scrolling motion
	-- nvim-notify
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	},
	{
		"vim-airline/vim-airline",
		config = function()
			vim.g["airline#extensions#tabline#enabled"] = 1
			vim.g.solarized_statusline = "normal"
		end,
	},
	{
		"vim-airline/vim-airline-themes",
		config = function()
			vim.g.airline_theme = "solarized"
		end,
	},
}
