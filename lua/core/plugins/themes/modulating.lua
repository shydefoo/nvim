local M = {}

M.set_theme = function(time)
	if 7 < time.hour and time.hour <= 10 then
		vim.cmd([[colorscheme Dawnfox]])
	elseif 10 < time.hour and time.hour <= 16 then
		vim.cmd([[colorscheme Dayfox]])
	elseif 16 < time.hour and time.hour <= 20 then
		vim.cmd([[colorscheme Duskfox]])
	else
		vim.cmd([[colorscheme Nightfox]])
	end
end

return M
