local nls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local homeDirectory = os.getenv("HOME")

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

nls.setup({
  debug = true,
  sources = {
    -- formatting
    nls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" } }),
    require("none-ls.formatting.eslint_d"),
    nls.builtins.formatting.prettier.with({
      extra_args = { "--single-quote", "false" },
    }),
    nls.builtins.formatting.terraform_fmt,
    nls.builtins.formatting.black.with({
      command = string.format("%s/.local/share/nvim/mason/bin/black", homeDirectory),
    }),
    nls.builtins.formatting.goimports,
    nls.builtins.formatting.gofmt,
    nls.builtins.formatting.isort,
    nls.builtins.formatting.shfmt,
    -- c,cpp formatting
    nls.builtins.formatting.clang_format,
    -- diagnostics
    require("none-ls-shellcheck.diagnostics"),
    -- code actions
    require("none-ls-shellcheck.code_actions"),
    -- nls.builtins.diagnostics.ruff,
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
            lsp_formatting(bufnr)
            --   vim.lsp.buf.format({ bufnr = bufnr })
          end
        end,
      })
    end
  end,
})
