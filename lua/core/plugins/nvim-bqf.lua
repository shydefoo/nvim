local M = {
	"kevinhwang91/nvim-bqf",
	dependencies = {
		{
			"junegunn/fzf",
			build = function()
				vim.fn["fzf#install"]()
			end,
		},
	},
}

return M
