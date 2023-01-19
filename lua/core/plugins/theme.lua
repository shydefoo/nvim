local settings = require("core.settings")

if settings.theme == "tokyonight" then
	return {
		"folke/tokyonight.nvim",
		config = function()
			require("core.plugins.themes.tokyonight")
		end,
	}
elseif settings.theme == "tundra" then
	return {
		"sam4llis/nvim-tundra",
		config = function()
			require("core.plugins.themes.tundra")
		end,
	}
elseif settings.theme == "vim-solarized8" then
	return {
		{
			"lifepillar/vim-solarized8",
			config = function()
				local M = require("core.plugins.themes.modulating")
				if pcall(M.set_theme(os.date("*t"))) then
					print("no error")
				else
					require("core.plugins.themes.solarized")
				end
			end,
		},
	}
else
	return {
		"EdenEast/nightfox.nvim",
		config = function()
			require("core.plugins.themes.modulating").set_theme(os.date("*t"))
		end,
	}
end
