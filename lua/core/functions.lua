-- local color_scheme_auto_update = function()
-- 	-- Create a timer handle (implementation detail: uv_timer_t).
-- 	local timer = vim.loop.new_timer()
-- 	local i = 0
-- 	-- Waits 1000ms, then repeats every 750ms until timer:close().
-- 	timer:start(1000, 6000, function()
-- 		print("timer invoked! i=" .. tostring(i))
-- 	end)
-- 	print("sleeping")
-- end

-- color_scheme_auto_update()
inspect = require("core.inspect")
local M = {}
M.get_visual_selection = function()
	local s_start = vim.fn.getpos("'<")
	local s_end = vim.fn.getpos("'>")
	local n_lines = math.abs(s_end[2] - s_start[2]) + 1
	local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)

	if next(lines) == nil then
		return ""
	end
	lines[1] = string.sub(lines[1], s_start[3], -1)
	if n_lines == 1 then
		lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
	else
		lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
	end
	local result = table.concat(lines, "\n")
	return result
end
return M
