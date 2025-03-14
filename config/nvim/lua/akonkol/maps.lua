vim.keymap.set("n", "<leader>nt", function() vim.cmd.Neotree("toggle", "current") end)
vim.keymap.set("n", "<leader>qq", function() vim.cmd("qa") end)
vim.keymap.set({ "n", "v" }, "<leader>cc", "gcc", { remap = true })
vim.keymap.set("n", "<leader>ee", function() vim.cmd("r~/.config/nvim/templates/golang-errblock.txt") end)

vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
		vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
		vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
		vim.keymap.set('n', 'dn', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
		vim.keymap.set('n', 'dp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
	end,
})

-- Quicker quickfix
vim.keymap.set("n", "<leader>q", function()
	require("quicker").toggle()
end, {
	desc = "Toggle quickfix",
})

vim.keymap.set("n", "<leader>l", function()
	require("quicker").toggle({ loclist = true })
end, {
	desc = "Toggle loclist",
})

require("quicker").setup({
	keys = {
		{
			">",
			function()
				require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
			end,
			desc = "Expand quickfix context",
		},
		{
			"<",
			function()
				require("quicker").collapse()
			end,
			desc = "Collapse quickfix context",
		},
	},
})
