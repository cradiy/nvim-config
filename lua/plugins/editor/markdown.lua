-- For `plugins/markview.lua` users.
return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  opts = {
    markdown_inline = {
      images = {
        enable = false,
      },
    },
  },
  keys = {
    {
      "<leader>mp",
      function()
        local bufnr = vim.api.nvim_get_current_buf()
        local state = require("markview.state").get_buffer_state(bufnr, false)
        local was_enabled = not state or state.enable

        require("markview.commands").toggle(bufnr)

        if was_enabled then
          if package.loaded["snacks.image"] then
            Snacks.image.placement.clean(bufnr)
          end
          pcall(vim.api.nvim_del_augroup_by_name, "snacks.image.inline." .. bufnr)
          vim.b[bufnr].snacks_image_attached = false
        else
          vim.schedule(function()
            if vim.api.nvim_buf_is_valid(bufnr) then
              Snacks.image.doc.attach(bufnr)
            end
          end)
        end
      end,
      desc = "Toggle Markdown Preview",
      ft = { "markdown", "typst", "html", "latex", "yaml" },
    },
    {
      "<leader>mh",
      "<cmd>Markview HybridToggle<cr>",
      desc = "Toggle Markdown Hybrid",
      ft = { "markdown", "typst", "html", "latex", "yaml" },
    },
  },

  -- Completion for `blink.cmp`
  -- dependencies = { "saghen/blink.cmp" },
};
