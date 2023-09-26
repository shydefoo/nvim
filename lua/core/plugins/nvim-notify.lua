local M = {
	"rcarriga/nvim-notify",
	config = function()
		vim.notify = require("notify")
		local opt = { top_down = false, timeout = 2000 }
		vim.notify.setup(opt)
	end,
}
return M
