
vim.opt.tabstop = 2 -- number of visual spaces per TAB
vim.opt.softtabstop = 2 -- number of spacesin tab when editing
vim.opt.shiftwidth = 2 -- insert 4 spaces on a tab



local function is_c_or_cpp_file(filepath)

    local file_extension = filepath:match("^.+%.([^%.]+)$")
    if file_extension == "c" or file_extension == "cpp" or file_extension == "h" or file_extension == "hpp" then
        return true
    end

    return false
end

local function clang_format()
    local filepath = vim.api.nvim_buf_get_name(0)
    if (is_c_or_cpp_file(filepath)) then
        local cmd = string.format("clang-format -i %s", vim.fn.shellescape(filepath))
         os.execute(cmd)
        vim.cmd("edit!")
    end
end


vim.keymap.set('n', 'ff', clang_format, {desc = "Cpp Format"})
