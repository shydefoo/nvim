local M = {
    "preservim/tagbar",
    ft = {"c", "cpp", "go", "python"},
    config = function()
        vim.keymap.set("n", "<F8>", "<cmd>TagbarToggle<cr>", { silent = true })
        vim.g.tagbar_type_go = {
            ctagstype = "go",
            kinds = {
                "p:package",
                "i:imports:1",
                "c:constants",
                "v:variables",
                "t:types",
                "n:interfaces",
                "w:fields",
                "e:embedded",
                "m:methods",
                "r:constructor",
                "f:functions",
            },
            ctagsbin = "gotags",
            ctagsargs = "-sort -silent",
            sro = ".",
            kind2scope = { t = "ctype", n = "ntype" },
            scope2kind = { ctype = "t", ntype = "n" },
        }
        vim.cmd([[autocmd FileType c,cpp,go,python TagbarOpen]])
    end,
}

return M
