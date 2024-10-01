vim.keymap.set("n", "<leader>nt", function () vim.cmd.Neotree("toggle","current") end)
vim.keymap.set("n", "<leader>qq", function () vim.cmd("qa") end)
vim.keymap.set({"n", "v"}, "<leader>cc", "gcc", {remap = true})
