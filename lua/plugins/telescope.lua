local setup = function()
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local builtin = require("telescope.builtin")

	local nmap = function(key,action,desc)
		vim.keymap.set("n",key,action,{desc=desc})
	end

	local find_grep = function()
		builtin.grep_string({ search = vim.fn.input(" Grep > ") });
	end

	nmap("<leader><leader>",builtin.find_files,"Telescope")
	nmap("<C-p>",builtin.git_files,"Telescope git")
	nmap("<leader>s",find_grep,"Telescope grep")
end

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },


      config = setup,
    }
    


