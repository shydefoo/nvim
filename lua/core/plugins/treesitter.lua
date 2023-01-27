local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local settings = require("core.settings")
		require("nvim-treesitter.configs").setup({
			ensure_installed = settings.treesitter_ensure_installed,
			highlight = { enable = true },
			auto_install = true,
		})
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.gotmpl = {
			install_info = {
				url = "https://github.com/ngalaiko/tree-sitter-go-template",
				files = { "src/parser.c" },
			},
			filetype = "gotmpl",
			used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl" },
		}
	end,
}
return M
