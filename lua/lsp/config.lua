
local lspconfig = require('lspconfig')

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

lspconfig.pylsp.setup({
})
lspconfig.ts_ls.setup({
   on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
    end,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
lspconfig.html.setup({
})
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
})
lspconfig.clangd.setup({ })
