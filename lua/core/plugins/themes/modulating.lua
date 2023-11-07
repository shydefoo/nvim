local M = {}

M.set_theme_now = function()
    -- print("set theme now!")
    local time = os.date("*t")
    if 7 <= time.hour and time.hour <= 9 and vim.g.colors_name ~= "dawnfox" then
        -- 0700 to 0959
        print("use dawnfox")
        vim.cmd([[colorscheme dawnfox]])
        vim.g.airline_theme = "solarized"
    elseif 10 <= time.hour and time.hour <= 15 and vim.g.colors_name ~= "dayfox" then
        -- 1000 to 1559
        print("use dayfox")
        vim.cmd([[colorscheme dayfox]])
        vim.g.airline_theme = "solarized"
    elseif 16 <= time.hour and time.hour <= 19 and vim.g.colors_name ~= "duskfox" then
        -- 1600 to 1959
        print("use duskfox")
        vim.cmd([[colorscheme duskfox]])
        vim.g.airline_theme = "solarized"
    elseif (20 <= time.hour or time.hour <= 6) and vim.g.colors_name ~= "nightfox" then
        -- 2000 to 0659
        print("use nightfox")
        vim.cmd([[colorscheme nightfox]])
        vim.g.airline_theme = "deus"
    end
end
M.set_theme = function()
    local timer = vim.loop.new_timer()
    timer:start(
        0,      -- wait for 0 ms
        600000, -- call every 10 min
        vim.schedule_wrap(M.set_theme_now)
    )
end

return M
