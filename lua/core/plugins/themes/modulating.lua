local M = {}

-- local color_scheme_auto_update = function()
-- 	-- Create a timer handle (implementation detail: uv_timer_t).
-- 	local timer = vim.loop.new_timer()
-- 	local i = 0
-- 	-- Waits 1000ms, then repeats every 750ms until timer:close().
-- 	timer:start(1000, 6000, function()
-- 		print("timer invoked")
-- 	end)
-- 	print("sleeping")
-- end

M.set_theme = function()
	local timer = vim.loop.new_timer()
	timer:start(
		500, -- wait for 500 ms
		600000, -- call every 10 min
		vim.schedule_wrap(function()
			local time = os.date("*t")
			if 7 < time.hour and time.hour <= 10 and vim.g.colors_name ~= "dawnfox" then
				print("use dawnfax")
				vim.cmd([[colorscheme Dawnfox]])
				vim.g.airline_theme = "solarized"
			elseif 10 < time.hour and time.hour <= 16 and vim.g.colors_name ~= "dayfox" then
				print("use dayfox")
				vim.cmd([[colorscheme Dayfox]])
				vim.g.airline_theme = "solarized"
			elseif 16 < time.hour and time.hour <= 20 and vim.g.colors_name ~= "duskfox" then
				print("use duskfox")
				vim.cmd([[colorscheme Duskfox]])
				vim.g.airline_theme = "solarized"
			elseif (20 < time.hour or time.hour <= 7) and vim.g.colors_name ~= "nightfox" then
				print("use nightfox")
				vim.cmd([[colorscheme Nightfox]])
				vim.g.airline_theme = "deus"
			end
		end)
	)
end

return M
