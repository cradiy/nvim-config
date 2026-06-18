return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo", "Format", "FormatToggle" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({
					async = true,
					lsp_format = "fallback",
				})
			end,
			mode = { "n", "v" },
			desc = "Format",
		},
	},
	init = function()
		vim.g.autoformat = true
	end,
	opts = {
		formatters_by_ft = {
			rust = { "rustfmt" },
		},
		format_on_save = function()
			if not vim.g.autoformat then
				return
			end

			return {
				timeout_ms = 2000,
				lsp_format = "fallback",
			}
		end,
	},
	config = function(_, opts)
		local conform = require("conform")
		conform.setup(opts)

		vim.api.nvim_create_user_command("Format", function()
			conform.format({
				async = true,
				lsp_format = "fallback",
			})
		end, {
			desc = "Format current buffer",
		})

		vim.api.nvim_create_user_command("FormatToggle", function()
			vim.g.autoformat = not vim.g.autoformat
			vim.notify("Format on save " .. (vim.g.autoformat and "enabled" or "disabled"))
		end, {
			desc = "Toggle format on save",
		})
	end,
}
