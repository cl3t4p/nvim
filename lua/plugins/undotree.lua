local setup = function()
	vim.keymap.set("n",'<leader><F5>',vim.cmd.UndotreeToggle)
end

return{
	'mbbill/undotree',
	config = setup,
}
