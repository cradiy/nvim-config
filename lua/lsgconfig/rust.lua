-- local lspconfig = require('lspconfig')

-- vim.api.nvim_create_autocmd('FileType', {
--   -- This handler will fire when the buffer's 'filetype' is "python"
--   pattern = 'rust',
--   callback = function()
--     vim.api.nvim_buf_set_keymap(0, 'n', '=', ':w<CR>:RustFmt<CR>', { noremap = true, silent = true })
--     -- vim.lsp.start({
--     --   name = 'Rust',
--     --   cmd = {'rust-analyzer'},
--     --   root_dir = vim.fs.root(ev.buf, {'Cargo.toml'}),
--     --   settings = {
--     --         ["rust-analyzer"] = {
--     --           checkOnSave = {
--     --             command = "clippy",  -- 启用 clippy 检查
--     --           },
--     --           cargo = {
--     --             allFeatures = true,  -- 启用所有 features
--     --           },
--     --           procMacro = {
--     --             enable = true,  -- 启用过程宏支持
--     --           },
--     --         },
--     --       },
--     -- })
--   end,
-- })

require 'lspconfig'.rust_analyzer.setup {
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = true,
            },
            checkOnSave = {
                command = 'clippy',
            },
            inlayHints = {
                bindingModeHints = {
                    enable = false,
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
                    enable = "never",
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
}
