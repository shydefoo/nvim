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
	"sql",
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
	"lua-ls",
	"pyright",
	"terraformls",
	"yamlls",
	"gopls",
	"solargraph",
}

return M
