require('lualine').setup {
    sections = {
        lualine_c = {
            function()
                -- invoke `progress` here.
                return require('lsp-progress').progress()
            end
        },
    },
    options = {
        theme = "auto"
    }
}

vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
    group = "lualine_augroup",
    pattern = "LspProgressStatusUpdated",
    callback = require("lualine").refresh,
})
