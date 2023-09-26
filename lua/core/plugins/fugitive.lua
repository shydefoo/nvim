return {
	"tpope/vim-fugitive",
    event = "VeryLazy",
    config = function ()
        vim.cmd([[
        map <leader>g :G
        ]])
    end
}
