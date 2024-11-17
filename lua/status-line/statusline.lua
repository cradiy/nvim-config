require('lualine').setup {
    sections = {
        lualine_c = {
           -- {
           --     'filename',
           --     file_status = true, -- 显示未保存状态
           --     path = 1,       -- 显示相对路径
           -- },
              function()
                -- invoke `progress` here.
                return require('lsp-progress').progress()
              end
        },
    },
}

vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = "lualine_augroup",
  pattern = "LspProgressStatusUpdated",
  callback = require("lualine").refresh,
})
