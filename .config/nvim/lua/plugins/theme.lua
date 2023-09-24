return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			vim.cmd("colorscheme catppuccin")
		end,
		opts = function()
			require("catppuccin").setup({
				flavour = "macchiato",
				transparent_background = true,
				dim_inactive = {
					enabled = true,
					shade = "dark",
					percentage = 0.15,
				},
				integrations = {
					treesitter = true,
				},
				custom_highlights = function(colors)
					return {
						NeoTreeCursorLine = { style = { "underline", "bold" } },
						LineNr = { fg = "#7dbfc9" },
					}
				end,
			})
		end,
	},
}
