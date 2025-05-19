vim.g.mapleader = "\\"
require('config.lazy')
require('config.remap')

--nvim-treesitter
require("config.nvim-treesitter")

--lsp settings
--TODO map lsp
require("config.lsp")


-- Themes
function setThemes(color)
	color = color or "tokyonight-day"
	vim.cmd.colorscheme(color)

	--vim.api.nvim_set_hl(0,"Normal", {bg= "none"})
	--vim.api.nvim_set_hl(0,"NormalFloat", {bg= "none"})
	
end

setThemes()


