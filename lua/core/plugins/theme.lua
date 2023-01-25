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
				require("core.plugins.themes.solarized")
			end,
		},
	}
else
	return {
		"EdenEast/nightfox.nvim",
		dependencies = {
			{ "vim-airline/vim-airline-themes" },
			{ "neoclide/coc.nvim" },
		},
		config = function()
			require("core.plugins.themes.modulating").set_theme()
		end,
	}
end
