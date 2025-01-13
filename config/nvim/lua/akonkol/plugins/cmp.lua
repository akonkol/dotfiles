local dark_green = "#8a9a7b"
local black = "#0d0c0c"
local golden = "#e6c384"
local light_gold = "#c8c093"
local border_style = "rounded"
local dark_background = "#121212"

vim.api.nvim_set_hl(0, "MyPmenu", { bg = dark_background, fg = dark_green })
vim.api.nvim_set_hl(0, "MyPmenuSel", { bg = light_gold, fg = black }) -- this is the line that is highlighted
vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = golden, bg = black })   -- this is the line that is highlighted
vim.api.nvim_set_hl(0, 'CmpDocNormal', { bg = dark_background })      -- Set the background of the window

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			formatting = {
				format = lspkind.cmp_format({
					mode = 'symbol', -- show only symbol annotations
					maxwidth = {
						-- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						-- can also be a function to dynamically calculate max width such as
						-- menu = function() return math.floor(0.45 * vim.o.columns) end,
						menu = 50, -- leading text (labelDetails)
						abbr = 50, -- actual suggestion item
					},
					ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
					show_labelDetails = true, -- show labelDetails in menu. Disabled by default

					-- The function below will be called before any actual modifications from lspkind
					-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
					before = function(entry, vim_item)
						-- ...
						return vim_item
					end
				})

			},
			window = {
				completion = cmp.config.window.bordered({
					border = border_style,
					winhighlight =
					"Normal:MyPmenu,FloatBorder:MyPmenu,CursorLine:MyPmenuSel",
				}),
				documentation = cmp.config.window.bordered({
					winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpDocBorder",
				}),

			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = 'nvim_lsp_signature_help' }
			}),
		})
	end,
}
