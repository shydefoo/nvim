local M = {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    config = function()
        vim.cmd([[
        nmap <leader>gd :DiffviewOpen
        nmap <leader>gdc :DiffviewClose
        ]])
    end
}
return M
