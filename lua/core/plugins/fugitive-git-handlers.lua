local M = {
	"tpope/vim-rhubarb",
	{
		"shumphrey/fugitive-gitlab.vim",
		config = function()
			vim.g.fugitive_gitlab_domains = { "https://source.golabs.io/" }
		end,
	},
}

return M
