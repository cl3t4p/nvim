vim.g.mapleader = "\\"
require('config.lazy')
require('config.remap')

vim.filetype.add({
    extension = {
        cu = "cuda",
        cuh = "cuda",
    },
})
--nvim-treesitter
require("config.nvim-treesitter")

--lsp settings
--TODO map lsp
require("config.lsp")
-- autoclose
require("autoclose").setup()


require("lualine").setup()
require("bufferline").setup()

-- Themes
function setThemes(color)

	require("catppuccin").setup({
		flavor = "mocha"
	})

	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

	--vim.api.nvim_set_hl(0,"Normal", {bg= "none"})
	--vim.api.nvim_set_hl(0,"NormalFloat", {bg= "none"})
	
end

setThemes()

vim.cmd("set number")


vim.o.autowriteall = true
