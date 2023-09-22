local wk = require("which-key")
local func = require("core.functions")
wk.register({
    -- nvim-tree key-bindings
    n = {
        name = "file", -- optional group name
        n = { "<cmd>NvimTreeToggle<cr>", "Toggle nvim tree" },
        f = { "<cmd>NvimTreeFindFileToggle<cr>", "Find file in tree" },
    },
    f = {
        name = "Files",
        -- g = { "<cmd>Telescope live_grep<cr>", "live grep" },
        b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        f = {
            "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
            "Fuzzy finder" }
    },
    g = {
        name = "git",
        g = { "<cmd>vertical G<cr>", "Git status" }
    },

    x = {
        name = "Trouble",
        x = { "<cmd>lua require('trouble').open()<cr>", "Trouble" },
        w = { "<cmd>lua require('trouble').open('workspace_diagnostics')<cr>", "Workspace Diagnostics" },
        d = { "<cmd>lua require('trouble').open('document_diagnostics')<cr>", "Document Diagnostics" },
        q = { "<cmd>lua require('trouble').open('quickfix')<cr>", "Quickfix" },
        l = { "<cmd>lua require('trouble').open('loclist')<cr>", "Location List" },
        R = { "<cmd>lua require('trouble').open('lsp_references')<cr>", "LSP References" },
    },
    c = {
        name = "quickfix shortcuts",
        c = {"<cmd>botright cope<cr>"},
        n = {"<cmd>cn<cr>"},
        p = {"<cmd>cp<cr>"},
        ["1"] = {"<cmd>colorscheme dayfox<cr>", "Dayfox"},
        ["2"] = {"<cmd>colorscheme duskfox<cr>", "Duskfox"},
        ["3"] = {"<cmd>colorscheme nightfox<cr>", "Nightfox"},
    },
    q = {
        s = { "<cmd>lua require('persistence').load()<cr>", "Restore Session" },
        l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore Last Session" },
        d = { "<cmd>lua require('persistence').stop()<cr>", "Don't Save Current Session" },
    },
}, { prefix = "<leader>", silent = true })


-- yank stack mappings
-- wk.register({
-- 	["<C-p>"] = { "<Plug>yankstack_substitute_older_paste" },
-- 	["<C-n>"] = { "<Plug>yankstack_substitute_newer_paste" },
-- }, { noremap = false })
vim.cmd([[
nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste
]])

-- git signs mapping
vim.keymap.set("n", "<leader>d", "<cmd>Gitsigns toggle_signs<cr>", { silent = true })
vim.keymap.set("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", { silent = true })
vim.keymap.set("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<cr>", { silent = true })
vim.keymap.set("n", "<leader>hp", "<cmd>Gitsigns preview_hunk_inline<cr>", { silent = true })
vim.keymap.set("n", "<leader>hx", "<cmd>Gitsigns reset_hunk<cr>", { silent = true })


-- https://github.com/nvim-telescope/telescope.nvim/issues/814#issuecomment-1238510694
vim.cmd([[
function!   QuickFixOpenAll()
    if empty(getqflist())
        return
    endif
    let s:prev_val = ""
    for d in getqflist()
        let s:curr_val = bufname(d.bufnr)
        if (s:curr_val != s:prev_val)
            exec "edit " . s:curr_val
        endif
        let s:prev_val = s:curr_val
    endfor
endfunction
]])

vim.api.nvim_set_keymap("n", "<leader>ka", ":call QuickFixOpenAll()<CR>", { noremap = true, silent = false })
