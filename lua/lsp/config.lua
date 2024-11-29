
local lspconfig = require('lspconfig')

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

lspconfig.pylsp.setup({
})




lspconfig.ts_ls.setup({
  on_attach = function()
    vim.opt.tabstop = 2 -- number of visual spaces per TAB
    vim.opt.softtabstop = 2 -- number of spacesin tab when editing
    vim.opt.shiftwidth = 2 -- insert 4 spaces on a tab
    vim.keymap.set('n', "ff", ":lua vim.lsp.buf.format({ async = true })<CR>", opts)
  end,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      }
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      }
    }

  }
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
lspconfig.cmake.setup({})
lspconfig.clangd.setup({ })
lspconfig.cssls.setup({

  on_attach = function(client)
    vim.opt.tabstop = 2 -- number of visual spaces per TAB
    vim.opt.softtabstop = 2 -- number of spacesin tab when editing
    vim.opt.shiftwidth = 2 -- insert 4 spaces on a tab
    vim.keymap.set('n', "ff", ":lua vim.lsp.buf.format({ async = true })<CR>", {silent = true, noremap = true})
  end,

})
