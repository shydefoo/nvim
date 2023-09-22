local M = {
    { "tpope/vim-rhubarb", lazy = true },
    {
        "shumphrey/fugitive-gitlab.vim",
        config = function()
            vim.g.fugitive_gitlab_domains = { "https://source.golabs.io/" }
        end,
        lazy = true,
    },
}

return M
