vim.lsp.config("clangd", {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  settings = {},
  on_attach = function(_, bufnr)
    print("clangd attached successfully to buffer " .. bufnr)
  end,
})

vim.lsp.enable("clangd")
return {}
