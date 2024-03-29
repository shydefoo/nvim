local M = {
    "fatih/vim-go",
    ft = {"go"},
    build = ":GoUpdateBinaries",
    config = function()
        vim.g.go_fmt_autosave = 0
        vim.g.go_imports_autosave = 0
        vim.g.go_rename_command = "gopls"
        vim.g.go_code_completion_enabled = 0
        vim.g.go_doc_balloon = 1
        vim.g.go_fmt_command = "goimports"
    end,
}

return M
