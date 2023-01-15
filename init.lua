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

--- set lazypath to runtimepath
vim.opt.rtp:prepend(lazypath)
vim.opt.rtp:append("/usr/opt/local/fzf")

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- example using a list of specs with the default options
vim.g.mapleader = "," -- make sure to set `mapleader` before lazy so your mappings are correct

require("config.basic")
require("lazy").setup("plugins")
