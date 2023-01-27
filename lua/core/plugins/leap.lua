local M = {
	"ggandor/leap.nvim",
	config = function()
		require("leap").add_default_mappings()
		vim.keymap.set({ "n", "x", "o" }, "<leader>s", "<Plug>(leap-forward-to)")
		vim.keymap.set({ "n", "x", "o" }, "<leader>S", "<Plug>(leap-backward-to)")
	end,
}

return M
