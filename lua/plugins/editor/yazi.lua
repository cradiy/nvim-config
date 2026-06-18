return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	keys = {
		-- 👇 in this section, choose your own keymappings!
		{
			"<leader>-",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			-- Open in the current working directory
			"<leader>cw",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory",
		},
		{
			-- NOTE: this requires a version of yazi that includes
			-- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
			"<c-up>",
			"<cmd>Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
	},
	--- @type YaziConfig
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = false,
		hooks = {
			before_opening_window = function(window_options)
				window_options.title = " 󰇥 Yazi  " .. vim.fn.fnamemodify(vim.fn.getcwd(0), ":~") .. " "
				window_options.title_pos = "center"
			end,
			yazi_opened = function(_, yazi_buffer_id)
				for _, win in ipairs(vim.fn.win_findbuf(yazi_buffer_id)) do
					if vim.api.nvim_win_is_valid(win) then
						vim.api.nvim_win_set_config(win, {
							title = " 󰇥 Yazi  " .. vim.fn.fnamemodify(vim.fn.getcwd(0), ":~") .. " ",
							title_pos = "center",
						})
					end
				end
			end,
		},
		keymaps = {
			show_help = "<f1>",
		},
		-- open_file_function = function(chosen_file, config, state)
		--
		-- 	--
		-- end,
	},
}
