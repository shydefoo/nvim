local M = {
    "mileszs/ack.vim",
    keys = "<leader>a",
    config = function()
        vim.cmd([[
        map <leader>a :Ack 
        ]])
    end,
}
return M
