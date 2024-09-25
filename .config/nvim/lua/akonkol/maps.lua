vim.keymap.set("n", "<leader>nt", function () vim.cmd.Neotree("toggle") end)
vim.keymap.set("n", "<leader>qq", function () vim.cmd("qa") end)
vim.keymap.set({"n", "v"}, "<leader>cc", "gcc", {remap = true})
vim.keymap.set({"n", "v"}, "<leader>b", function () vim.cmd("GBrowse") end)
