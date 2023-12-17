local M = {}

M.theme = "tokyonight"
M.treesitter_ensure_installed = {
	"bash",
	"cmake",
    "csv",
	"css",
	"dockerfile",
	"go",
	"hcl",
	"html",
	"java",
	"javascript",
    "typescript",
	"json",
	"kotlin",
	"ledger",
	"lua",
	"markdown",
	"markdown_inline",
	"query",
	"python",
	"regex",
	"toml",
	"vim",
    "vimdoc",
	"yaml",
	"sql",
    "rust",
    "jq",
    "c",
    "cpp",
    "cmake",
    "gitcommit",
    "gitignore",
    "http",
    "ruby",
    "promql",
    "proto"
}
M.mason_tool_installer_ensure_installed = {
	-- Formatter
	"black",
	"prettier",
	"stylua",
	"shfmt",
	-- Linter
	"eslint_d",
	"shellcheck",
	"tflint",
	"yamllint",
    "cpplint",
    "cpptools",
	-- DAP
	"debugpy",
}

M.lsp_servers = {
	-- LSP
	"bashls",
	"dockerls",
	"jsonls",
	"marksman",
	"tsserver",
	"lua_ls",
	"pyright",
	"terraformls",
	"yamlls",
	"gopls",
	"solargraph",
    "clangd"
}

return M
