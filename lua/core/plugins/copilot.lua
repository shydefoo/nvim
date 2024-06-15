local M = {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    -- event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
            filetypes = {
                yaml = true,
            }
        })
    end,
}
return M
