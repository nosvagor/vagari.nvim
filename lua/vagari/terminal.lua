local terminal = {}
local p = require("vagari.palette")

-- terminal colors tradit
-- /-------------------------------------------------------------\
-- | black   red     green    blue     magenta  cyan     white   | color
-- | color0  color1  color2   color4   color5   color6   color7  | normal
-- | color8  color9  color10  color12  color13  color14  color15 | bright
-- \-------------------------------------------------------------/

function terminal.setup()
	vim.g.terminal_color_0 = p.drk_0
	vim.g.terminal_color_1 = p.rby_2
	vim.g.terminal_color_2 = p.erm_2
	vim.g.terminal_color_3 = p.sun_2
	vim.g.terminal_color_4 = p.blu_2
	vim.g.terminal_color_5 = p.prp_2
	vim.g.terminal_color_6 = p.cyn_2
	vim.g.terminal_color_7 = p.fg
	vim.g.terminal_color_8 = p.slt_2
	vim.g.terminal_color_9 = p.rby_4
	vim.g.terminal_color_10 = p.erm_4
	vim.g.terminal_color_11 = p.sun_4
	vim.g.terminal_color_12 = p.blu_4
	vim.g.terminal_color_13 = p.prp_4
	vim.g.terminal_color_14 = p.cyn_4
	vim.g.terminal_color_15 = p.brt_2
end

return terminal
