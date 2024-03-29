local settings = require("core.settings")
local nvim_lsp = require("lspconfig")
local lsp_settings = require("core.plugins.lsp.settings")

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- enable autoclompletion via nvim-cmp
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("core.functions").on_attach(function(client, buffer)
	-- disable formatting for LSP clients as this is handled by null-ls
	require("core.plugins.lsp.keys").on_attach(client, buffer)
end)

for _, lsp in ipairs(settings.lsp_servers) do
	nvim_lsp[lsp].setup({
		before_init = function(_, config)
			if lsp == "pyright" then
				config.settings.python.pythonPath = utils.get_python_path(config.root_dir)
			end
		end,
		capabilities = capabilities,
		flags = { debounce_text_changes = 150 },
		-- NOTE: Temporarily comment out
		settings = {
			-- json = lsp_settings.json,
			-- Lua = lsp_settings.lua,
			-- ltex = lsp_settings.ltex,
			-- redhat = { telemetry = { enabled = false } },
			-- texlab = lsp_settings.tex,
			yaml = lsp_settings.yaml,
            python = {
                analysis = { diagnosticMode = "off", typeCheckingMode = "off" },
            },
		},
	})
end

-- fix cpp ifdef highlighting
vim.api.nvim_set_hl(0, '@lsp.type.comment.cpp', {})
