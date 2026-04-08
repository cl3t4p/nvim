vim.bo.commentstring = "; %s"
vim.bo.comments = ":;"
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true
vim.bo.lisp = true
vim.bo.iskeyword = vim.bo.iskeyword .. ",-,!,?,.,+,*,/,=,<,>,_"
vim.bo.omnifunc = "v:lua.require'smt2'.omnifunc"
