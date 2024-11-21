
local function rust_fmt()
    vim.cmd(":RustFmt")
    vim.cmd(":w")
end

local function expand_macro()
    vim.cmd(':RustLsp expandMacro')
end

local map = vim.keymap.set


map('n', 'ff', rust_fmt, {desc = "Rust Format"})

vim.api.nvim_create_user_command('Expand', expand_macro, {})
