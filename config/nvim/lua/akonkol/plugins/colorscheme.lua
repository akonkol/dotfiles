return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	config = function()
		require("kanagawa").setup({
			theme = "dragon",
			background = {
				dark = "dragon", -- try "dragon" !
			},
		})
		vim.cmd("colorscheme kanagawa")
	end
}
