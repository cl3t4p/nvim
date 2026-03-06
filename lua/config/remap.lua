vim.g.mapleader = "\\"
--vim.keymap.set("n","<leader>v",vim.cmd.Ex)
vim.keymap.set("n", "<leader>v", "<cmd>Neotree toggle right<cr>", { desc = "Neo-tree: toggle (right)" })
-- Window navigation with leader + arrow keys
vim.keymap.set("n", "<M-Left>",  "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<M-Down>",  "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<M-Up>",    "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<M-Right>", "<C-w>l", { desc = "Window right" })




-- Bufferline 

-- Alt+1..9 -> go to bufferline ordinal 1..9
for i = 1, 9 do
  vim.keymap.set("n", "<Esc>" .. i .. "", "<cmd>BufferLineGoToBuffer " .. i .. "<cr>", {
    desc = "Go to buffer " .. i,
    silent = true,
  })
end

vim.keymap.set("n", "<C-S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer", silent = true })
vim.keymap.set("n", "<C-Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer", silent = true })


vim.keymap.set("t", "<C-Tab>", [[<C-\><C-n><cmd>BufferLineCycleNext<cr>]], { silent = true })
vim.keymap.set("t", "<C-S-Tab>", [[<C-\><C-n><cmd>BufferLineCyclePrev<cr>]], { silent = true })


-- Alt+q: close current buffer, move to another if available
vim.keymap.set("n", "<M-S-q>", "<cmd>BufferLineCloseOthers<cr>", { silent = true })
vim.keymap.set("n", "<M-q>", "<cmd>bdelete<cr>", { silent = true })
