local terminal = {}
local p = require("vagari.palette")

-- terminal colors tradit
-- /-------------------------------------------------------------\
-- | black   red     green    blue     magenta  cyan     white   | color
-- | color0  color1  color2   color4   color5   color6   color7  | normal
-- | color8  color9  color10  color12  color13  color14  color15 | bright
-- \-------------------------------------------------------------/

function terminal.setup()
	vim.g.terminal_color_0 = p.black
	vim.g.terminal_color_1 = p.red
	vim.g.terminal_color_2 = p.green
	vim.g.terminal_color_3 = p.yellow
	vim.g.terminal_color_4 = p.blue
	vim.g.terminal_color_5 = p.purple
	vim.g.terminal_color_6 = p.cyan
	vim.g.terminal_color_7 = p.white
	vim.g.terminal_color_8 = p.grey
	vim.g.terminal_color_9 = p.red
	vim.g.terminal_color_10 = p.green
	vim.g.terminal_color_11 = p.yellow
	vim.g.terminal_color_12 = p.blue
	vim.g.terminal_color_13 = p.purple
	vim.g.terminal_color_14 = p.cyan
	vim.g.terminal_color_15 = p.white
end

return terminal
