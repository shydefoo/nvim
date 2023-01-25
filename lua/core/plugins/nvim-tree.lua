local M = {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		open_on_setup = false,
		open_on_setup_file = false,
		sort_by = "case_sensitive",
		hijack_netrw = false,
		disable_netrw = false,
		view = {
			float = {
				enable = true,
				open_win_config = {
					relative = "editor",
					width = 90,
					height = 60,
					row = (vim.api.nvim_list_uis()[1].height - 60) * 0.4,
					col = (vim.api.nvim_list_uis()[1].width - 90) * 0.5,
				},
			},
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
					{ key = "mm", action = "full_rename" },
					{ key = "mr", action = "system_open" },
					{ key = "C", action = "cd" },
					{ key = "I", action = "toggle_dotfiles" },
					{ key = "?", action = "toggle_help" },
				},
			},
		},
		renderer = {
			icons = {
				git_placement = "after",
				glyphs = {
					git = {
						untracked = "u",
					},
				},
			},
			group_empty = true,
		},
		filters = { dotfiles = true },
		git = { ignore = false },
	},
}

return M
