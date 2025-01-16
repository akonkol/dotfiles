return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = "make"
		},
	},
	config = function()
		require("telescope").setup {
			preview = true,
			previewer = require('telescope.previewers').new_buffer_previewer {
				wrap = true,
			},
			-- Set the layout strategy for the preview window
			layout_strategy = "horizontal",
			layout_config = {
				horizontal = {
					width = 0.5,
					height = 0.7,
					preview_cutoff = 120,
				},
				vertical = {
					height = 0.5,
					width = 0.7,
					preview_cutoff = 120,
				}
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			}
		}
		require("telescope").load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>",
			{ desc = "Find string under cursor in cwd" })
	end,
}
