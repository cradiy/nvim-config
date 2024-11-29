require('lualine').setup {
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      "%{expand('%:~:.')}",
    },
    lualine_x = {
      'fileformat',
      "filetype",
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  options = {
    theme = "tokyonight"
  }
}

vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
    group = "lualine_augroup",
    pattern = "LspProgressStatusUpdated",
    callback = require("lualine").refresh,
})
