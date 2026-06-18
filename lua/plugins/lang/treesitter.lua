local parsers = {
	"bash",
	"css",
	"fish",
	"html",
	"javascript",
	"jsx",
	"json",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"nu",
	"query",
	"regex",
	"rust",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
	"zsh",
}

local filetypes = {
	"bash",
	"css",
	"fish",
	"help",
	"html",
	"javascript",
	"javascriptreact",
	"json",
	"lua",
	"markdown",
	"nu",
	"rust",
	"sh",
	"toml",
	"typescript",
	"typescriptreact",
	"vim",
	"vimdoc",
	"yaml",
	"zsh",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		ts.setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		vim.treesitter.language.register("bash", { "sh" })
		vim.treesitter.language.register("jsx", { "javascriptreact" })
		vim.treesitter.language.register("tsx", { "typescriptreact" })

		local installed = {}
		for _, lang in ipairs(ts.get_installed("parsers")) do
			installed[lang] = true
		end

		local missing = {}
		for _, lang in ipairs(parsers) do
			if not installed[lang] then
				missing[#missing + 1] = lang
			end
		end
		if #missing > 0 then
			ts.install(missing)
		end

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("cradiy_treesitter", { clear = true }),
			pattern = filetypes,
			callback = function(args)
				local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
				if not lang then
					return
				end
				if not pcall(vim.treesitter.language.add, lang) then
					return
				end
				pcall(vim.treesitter.start, args.buf, lang)
			end,
		})
	end,
}
