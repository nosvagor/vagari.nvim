local vagari = {}

vagari.load = function()
	if vim.version().minor < 8 then
		vim.notify_once("vagari.nvim: neovim 0.8 or higher required")
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

-- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md
-- :so $VIMRUNTIME/syntax/hitest.vim
-- :telescope highlights
-- :h group-name
-- :h highlight
