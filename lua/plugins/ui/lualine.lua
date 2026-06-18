return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },

			lualine_c = {
				function()
					local mode_short = vim.api.nvim_get_mode().mode -- 获取当前模式的短名称 (e.g., 'n', 'i', 'v')

					if mode_short == "t" then
						return vim.fn.expand("%:t")
					else
						return vim.fn.expand("%:~:.")
						-- 其他模式下显示文件类型
					end
				end,
			},
			-- lualine_c = {
			-- 	"%{expand('%:~:.')}",
			-- },
			lualine_x = {
				"filetype",
			},

			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		options = {
			theme = "tokyonight",
		},
	},

	extensions = { "neo-tree", "lazy", "fzf", "terminal" },
}
