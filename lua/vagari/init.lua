local vagari = {}

vagari.load = function()
	if vim.version().minor < 9 then
		vim.notify_once("vagari.nvim: neovim 0.9 or higher required")
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
