local api = vim.api
-- windows to close with "q"
api.nvim_create_autocmd("FileType", {
    pattern = {
        "help", "startuptime", "qf", "fugitive", "null-ls-info", "dap-float"
    },
    command = [[nnoremap <buffer><silent> q :close<CR>]]
})
