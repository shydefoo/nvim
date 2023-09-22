local M = {
    "heavenshell/vim-pydocstring",
    event = "VeryLazy",
    build = "make install",
    config = function()
        vim.g.pydocstring_doq_path = "/Users/shide.foo/.pyenv/versions/3.7.8/bin/doq"
        vim.keymap.set("n", "<C-_>", "<Plug>(pydocstring)")
    end,
}

return M
