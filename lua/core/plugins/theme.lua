local settings = require("core.settings")

if settings.theme == "nightfox" then
    return {
        "EdenEast/nightfox.nvim",
        config = function() require("core.plugins.themes.nightfox") end

    }
elseif settings.theme == "tundra" then
    return {
        "sam4llis/nvim-tundra",
        config = function() require("core.plugins.themes.tundra") end

    }
elseif settings.theme == "vim-solarized8" then
    return {
        {"vim-airline/vim-airline"}, {"vim-airline/vim-airline-themes"}, {
            "lifepillar/vim-solarized8",
            config = function()
                require("core.plugins.themes.solarized")
            end
        }
    }

end
