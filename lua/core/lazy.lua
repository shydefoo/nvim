--- set path to lazy plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

--- clone lazy repo if not available
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.g.mapleader = ","
--- set lazypath to runtimepath
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("core.plugins", {
	-- defaults = { lazy = true },
	install = {
		-- install missing plugins on startup. This doesn't increase startup time.
		missing = true,
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = true, -- get a notification when changes are found
	},
	debug = false,
})
