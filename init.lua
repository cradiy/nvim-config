local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = "󰌵",
		},
	},
})

require("options")
require("CradiyVim")
require("keymap")
-- require("util")
require("autocmd")

require("lazy").setup("plugins")
require("colorscheme")


-- require("mason.config")
-- require("format")
-- require("config.neo-tree")
-- require("config.fzf")
-- require("config.blink")
-- require("config.yazi")
-- require("config.lualine")
-- require("config.bufferline")
