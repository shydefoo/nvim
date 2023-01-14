return {
    {"lifepillar/vim-solarized8"}, {"neoclide/coc.nvim", lazy = false}, {
        "nvim-tree/nvim-tree.lua",
        dependencies = {'nvim-tree/nvim-web-devicons'},
        keys = {
            {"<leader>nn", "<cmd>NvimTreeToggle<cr>", desc = "NvimTreeToggle"}
        },
        config = function()
            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    side = "right",
                    mappings = {
                        list = {
                            {key = "u", action = "dir_up"},
                            {key = "s", action = "vsplit"},
                            {key = "v", action = "ssplit"},
                            {key = "t", action = "tabnew"},
                            {key = "ma", action = "create"},
                            {key = "md", action = "remove"},
                            {key = "mD", action = "trash"},
                            {key = "mm", action = "rename"},
                            {key = "mr", action = "system_open"}
                        }
                    }
                },
                renderer = {group_empty = true},
                filters = {dotfiles = true}
            })
        end
    }, {"tpope/vim-surround", lazy = false},
    {"tpope/vim-commentary", lazy = false}, {
        "junegunn/fzf.vim",
        lazy = false,
        keys = {{"<leader>f", "<cmd>Files<cr>", desc = "fzf"}}
    }, {"junegunn/fzf", lazy = false}, {"jiangmiao/auto-pairs", lazy = false},
    {"yuttie/comfortable-motion.vim", lazy = false},
    {"tpope/vim-fugitive", lazy = false}, {
        "dense-analysis/ale",
        lazy = false,
        config = function()
            vim.g.ale_fixers = {lua = {'lua-format'}}
            vim.g.ale_fix_on_save = 1
            vim.g.ale_lint_on_save = 1
            vim.g.ale_lint_on_insert_leave = 0
        end,
        keys = {
            {"<leader>fx", "<cmd>ALEFix<cr>", desc = "ale fix"},
            {"<leader>fl", "<cmd>ALELint<cr>", desc = "ale lint"}
        }
    }
}

