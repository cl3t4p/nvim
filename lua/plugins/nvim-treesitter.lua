
return{
	'nvim-treesitter/nvim-treesitter',
	dependencies = { "OXY2DEV/markview.nvim" },
	lazy = false,
	branch = 'master',
	build = ':TSUpdate'
}
