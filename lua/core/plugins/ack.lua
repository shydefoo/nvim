local M = {
    "mileszs/ack.vim",
    keys = "<leader>g",
    config = function()
        vim.cmd([[
        map <leader>g :Ack 
        ]])
    end,
}
return M
