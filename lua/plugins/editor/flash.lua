return {
  "folke/flash.nvim",
  event = "VeryLazy",
  vscode = true,
  ---@type Flash.Config
  opts = {},
  config = function(_, opts)
    require("flash").setup(opts)

    local function set_flash_highlights()
      vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#cdd6f4", bg = "#3e68d7" })
      vim.api.nvim_set_hl(0, "FlashCurrent", { fg = "#1e1e2e", bg = "#fab387" })
      vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#1e1e2e", bg = "#f38ba8", bold = true })
      vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = "#6c7086" })
    end

    set_flash_highlights()
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("cradiy_flash_highlights", { clear = true }),
      callback = set_flash_highlights,
    })
  end,
  -- stylua: ignore
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function() require("flash").jump() end,
      desc = "Flash"
    },
    {
      "S",
      mode = { "n", "o", "x" },
      function() require("flash").treesitter() end,
      desc = "Flash Treesitter"
    },
    {
      "r",
      mode = "o",
      function() require("flash").remote() end,
      desc = "Remote Flash"
    },
    {
      "R",
      mode = { "o", "x" },
      function() require("flash").treesitter_search() end,
      desc = "Treesitter Search"
    },
    {
      "<c-s>",
      mode = { "c" },
      function() require("flash").toggle() end,
      desc = "Toggle Flash Search"
    },
  },
}
