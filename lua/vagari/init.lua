local vagari = {}

vagari.config = {
	terminal_colors = true,
	ending_tildes = false,
	attributes = {
		undercurl = true,
		underline = true,
		underdouble = true,
		underdotted = true,
		underdashed = true,
		strikethrough = true,
		bold = true,
		italic = true,
	},
	overrides = {
		palette = {},
		highlights = {},
		semantic = {},
	},
}

function vagari.setup(config)
	vagari.config = vim.tbl_extend("force", vagari.config, config or {})
end

vagari.load = function()
	if vim.version().minor < 8 then
		vim.notify_once("vagari.nvim: you must use neovim 0.8 or higher")
		return
	end

	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "vagari"

	require("vagari.highlights").setup()
	require("vagari.terminal").setup()
end

return vagari
