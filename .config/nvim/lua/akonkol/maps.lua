vim.keymap.set("n", "<leader>nt", function () vim.cmd.Neotree("toggle","current") end)
vim.keymap.set("n", "<leader>qq", function () vim.cmd("qa") end)
vim.keymap.set({"n", "v"}, "<leader>cc", "gcc", {remap = true})
vim.keymap.set("n", "<leader>ee", function () vim.cmd("r~/.config/nvim/templates/golang-errblock.txt") end)
