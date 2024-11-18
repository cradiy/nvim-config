
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

local on_attach = function(client, bufnr)
    require "completion".on_attach(client)
    vim.keymap.set('n', '=', ":Rustfmt<CR>", opts)
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
end
require 'lspconfig'.rust_analyzer.setup({
    on_attach,
    settings = {
        ['rust-analyzer'] = {
            completion = {
                autoimport = true, -- 自动补全未引入项
            },
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                loadOutDirsFromCheck = true,
                allFeatures = true,     -- 启用所有特性
                runBuildScripts = true, -- 启用构建脚本
            },
            rustfmt = {
                rangeFormatting = true, -- 启用 Rustfmt 范围格式化
            },
            procMacro = { enable = true },
            checkOnSave = {
                command = 'clippy',
            },
            inlayHints = {
                bindingModeHints = {
                    enable = true,
                },
                chainingHints = {
                    enable = true,
                },
                closingBraceHints = {
                    enable = true,
                    minLines = 25,
                },
                closureReturnTypeHints = {
                    enable = "never",
                },
                lifetimeElisionHints = {
                    enable = "never",
                    useParameterNames = false,
                },
                maxLength = 25,
                parameterHints = {
                    enable = true,
                },
                reborrowHints = {
                    enable = "true",
                },
                renderColons = true,
                typeHints = {
                    enable = true,
                    hideClosureInitialization = false,
                    hideNamedConstructor = false,
                },
            },
        }
    }
})
