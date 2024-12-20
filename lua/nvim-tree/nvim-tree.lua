

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end


vim.keymap.set('n', 'tt', ":NvimTreeFindFile<CR>", {noremap = true, silent = true, desc = "Find File"})

-- pass to setup along with your other options
require("nvim-tree").setup {
  on_attach = my_on_attach,
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
    icons = {
      glyphs = {
        modified = "*",
      }
    }
  },
  filters = {
    dotfiles = true,
  },
}
