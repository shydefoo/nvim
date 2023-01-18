local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = { "make" } },
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"ptethng/telescope-makefile",
		"crispgm/telescope-heading.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local fb_actions = require("telescope").extensions.file_browser.actions
		local actions = require("telescope.actions")
		telescope.setup({
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case" or "smart_case"
					defaults = {
						sorting_strategy = "descending",
					},
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
				file_browser = {
					initial_mode = "normal",
					hijack_netrw = true,
					hidden = true,
					mappings = {
						n = {
							["ma"] = fb_actions.create,
							["mr"] = fb_actions.rename,
							-- ["<c-h>"] = actions.which_key,
							["I"] = fb_actions.toggle_hidden,
							["md"] = fb_actions.remove,
							["mm"] = fb_actions.move,
							["y"] = fb_actions.copy,
							["A"] = fb_actions.select_all,
							["c"] = fb_actions.change_cwd,
							["q"] = actions.close,
							["u"] = fb_actions.goto_parent_dir,
						},
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				buffers = {
					ignore_current_buffer = true,
				},
			},
			defaults = {
				file_ignore_patterns = { "node_modules", ".terraform", "%.jpg", "%.png" },
				mappings = {
					i = {
						-- Close on first esc instead of going to normal mode
						-- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
					},
				},
				sorting_strategy = "ascending",
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")
		telescope.load_extension("heading")
		telescope.load_extension("make")

		vim.keymap.set("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files()<cr>")
		vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep<cr>")
		vim.keymap.set("v", "gv", "zy:Telescope grep_string default_text=<C-r>z<cr>", { noremap = true, silent = true })
	end,
}

return M
