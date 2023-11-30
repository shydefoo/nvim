local M = {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ft = { "yaml", "helm", "json" },
    config = function()
        require("indent_blankline").setup({
            show_current_context = true,
            show_current_context_start = true,
        })
    end,
}

return M
