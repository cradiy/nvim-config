local servers = {
	html = {},
	ruff = {
		on_attach = function(client)
			client.server_capabilities.hoverProvider = false
		end,
	},
	basedpyright = {},
	taplo = {
		on_attach = function(client, bufnr)
			local filename = vim.api.nvim_buf_get_name(bufnr)
			if filename:match("Cargo%.toml$") then
				client.server_capabilities.hoverProvider = false
			end
		end,
	},
	bashls = {},
	denols = {},
	wgsl_analyzer = {},
	jsonls = {
		root_dir = function(bufnr, on_dir)
			local root = vim.fs.root(bufnr, {
				".git",
				"package.json",
				"tsconfig.json",
				"jsconfig.json",
				"deno.json",
				"deno.jsonc",
				"tauri.conf.json",
			})
			on_dir(root or vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)))
		end,
		on_new_config = function(new_config)
			new_config.settings = new_config.settings or {}
			new_config.settings.json = new_config.settings.json or {}
			new_config.settings.json.schemas = require("schemastore").json.schemas({
				extra = {
					{
						description = "Tauri v2 configuration file",
						fileMatch = {
							"tauri.conf.json",
							"tauri.*.conf.json",
							"**/src-tauri/tauri.conf.json",
							"**/src-tauri/tauri.*.conf.json",
						},
						name = "tauri.conf.json",
						url = "https://schema.tauri.app/config/2",
					},
				},
			})
		end,
		settings = {
			json = {
				format = {
					enable = true,
				},
				validate = { enable = true },
			},
		},
	},
	vtsls = {},
	cssls = {},
	lua_ls = {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
						vim.fn.stdpath("config"),
					},
				},
				completion = {
					callSnippet = "Replace",
				},
				diagnostics = {
					globals = { "vim", "CradiyVim" },
				},
			},
		},
	},
}

local ensure_installed = vim.tbl_keys(servers)
table.sort(ensure_installed)

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			"b0o/schemastore.nvim",
		},
		config = function()
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			for server, config in pairs(servers) do
				vim.lsp.config(server, config)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("cradiy_lsp_keymaps", { clear = true }),
				callback = function(args)
					local opts = { buffer = args.buf, silent = true }
					vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "LSP Hover" }))
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Goto Definition" }))
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Goto Declaration" }))
					vim.keymap.set("n", "gI", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Goto Implementation" }))
					vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "Goto Type Definition" }))
					vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "References" }))
					vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "LSP Rename" }))
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code Action" }))
				end,
			})
		end,
	},
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = ensure_installed,
			automatic_enable = ensure_installed,
		},
	},
}
