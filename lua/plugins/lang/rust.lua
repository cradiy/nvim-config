vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {},
  -- LSP configuration
  server = {
    on_attach = function()
      -- you can also put keymaps in here
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ["rust-analyzer"] = {
        inlayHints = {
          enabled = true,
        },
        -- cachePriming = {
        -- 	enable = false,
        -- },
        procMacro = {
          enable = true,
        },
        check = {
          command = "clippy",
          extraArgs = {
            "--no-deps",
            "--message-format=json-diagnostic-rendered-ansi",
          },
          workspace = false,
        },
      },
    },
  },
  -- DAP configuration
  dap = {},
}

return {
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {
      completion = {
        crates = {
          enabled = true,
        },
      },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "*", -- Recommended
    lazy = false, -- This plugin is already lazy
  },
}
