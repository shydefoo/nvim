local nls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

nls.setup({
    debug = true,
    sources = {
        nls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" } }),
        -- nls.builtins.diagnostics.flake8.with({
        --     extra_args = { "--max-line-length=120" },
        --     command = "/Users/shide.foo/.pyenv/versions/3.9.1/bin/flake8",
        -- }),
        nls.builtins.diagnostics.eslint_d,
        nls.builtins.formatting.prettier.with({
            extra_args = { "--single-quote", "false" },
        }),
        nls.builtins.formatting.terraform_fmt,
        nls.builtins.formatting.black.with({
            command = "/Users/shidefoo/.local/share/nvim/mason/bin/black",
        }),
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.gofmt,
        nls.builtins.diagnostics.golangci_lint.with({
            timeout = 10000,
        }),
        nls.builtins.formatting.latexindent.with({
            extra_args = { "-g", "/dev/null" }, -- https://github.com/cmhughes/latexindent.pl/releases/tag/V3.9.3
        }),
        nls.builtins.code_actions.shellcheck,
        nls.builtins.code_actions.gitsigns,
        nls.builtins.formatting.shfmt,
        -- nls.builtins.diagnostics.ruff,
        -- c,cpp formatting
        nls.builtins.formatting.clang_format,
    },
    on_attach = function(client, bufnr)
        vim.keymap.set(
            "n",
            "<leader>fx",
            "<cmd>lua require('core.plugins.lsp.utils').toggle_autoformat()<cr>",
            { desc = "Toggle format on save" }
        )
        -- NOTE: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    if AUTOFORMAT_ACTIVE then -- global var defined in functions.lua
                        vim.lsp.buf.format({ bufnr = bufnr })
                    end
                end,
            })
        end
    end,
})
