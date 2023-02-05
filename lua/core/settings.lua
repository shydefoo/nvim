local M = {}

M.theme = ""
M.treesitter_ensure_installed = {
	"bash",
	"cmake",
	"css",
	"dockerfile",
	"go",
	"hcl",
	"html",
	"java",
	"javascript",
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
	"yaml",
}
M.mason_tool_installer_ensure_installed = {
	-- LSP
	"bash-language-server",
	"dockerfile-language-server",
	"json-lsp",
	"marksman",
	"typescript-language-server",
	"lua-language-server",
	"pyright",
	"terraform-ls",
	"yaml-language-server",
	"gopls",
	"solargraph",
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
	-- DAP
	"debugpy",
}

return M
