local wk = require("which-key")

-- nvim-tree key-bindings
wk.register({
    n = {
        name = "file", -- optional group name
        n = {"<cmd>NvimTreeToggle<cr>", "Toggle NvimTree"},
        f = {"<cmd>NvimTreeFindFile<cr>", "Find file in tree"}
    }
}, {prefix = "<leader>"})

-- coc mappings
wk.register({
    j = {
        name = "coc", -- optional group name
        d = {"<Plug>(coc-definition)", "Jump to definition"},
        t = {"<Plug>(coc-type-definition)", "Jump to type"},
        r = {"<Plug>(coc-references)", "Jump to references"},
        n = {"<Plug>(coc-diagnostic-next-error)", "Jump to next error"},
        p = {"<Plug>(coc-diagnostic-prev-error)", "Jump to previous error"}
    }
}, {prefix = "<leader>", noremap = false})
