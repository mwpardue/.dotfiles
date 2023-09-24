return {
	{
		"akinsho/bufferline.nvim",
		version = "v3.*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				highlights = {
					buffer_selected = { bold = true },
					diagnostic_selected = { bold = true },
					info_selected = { bold = true },
					info_diagnostic_selected = { bold = true },
					warning_selected = { bold = true },
					warning_diagnostic_selected = { bold = true },
					error_selected = { bold = true },
					error_diagnostic_selected = { bold = true },
				},
				options = {
					indicator = {
						style = "underline",
					},
					separator_style = "thick",
					numbers = function(opts)
						return string.format("%s|%s", opts.id, opts.raise(opts.ordinal))
					end,
					offsets = {
						{
							filetype = "neo-tree",
							text = "Neo Tree",
							highlight = "neo-tree",
							separator = true,
						},
					},
				},
			})
		end,
	},
}
