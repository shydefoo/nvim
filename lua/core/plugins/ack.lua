local M = {
	"mileszs/ack.vim",
	config = function()
		vim.cmd([[
        map <leader>g :Ack 
        ]])
	end,
}
return M
