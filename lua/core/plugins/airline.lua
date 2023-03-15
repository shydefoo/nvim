local M = {
	{
		"vim-airline/vim-airline",
		dependencies = {
			{ "vim-airline/vim-airline-themes" },
		},
		config = function()
			vim.g["airline#extensions#tabline#enabled"] = 1
			vim.g["airline#extensions#tabline#formatter"] = "unique_tail"
			vim.g["airline#extensions#coc#enabled"] = 1
			vim.g["airline#extensions#fugitiveline#enabled"] = 1
			vim.g["airline#extensions#branch#enabled"] = 1
		end,
	},
}
return M
