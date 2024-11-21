require("CopilotChat").setup {
  highlight_headers = false,
 -- separator = '---',
  error_header = '> [!ERROR] Error',
  window = {
    layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
    width = 0.3, -- fractional width of parent, or absolute width in columns when > 1
    height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
    -- Options below only apply to floating windows
    relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
    border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
    row = nil, -- row position of the window, default is centered
    col = nil, -- column position of the window, default is centered
    title = 'Copilot Chat', -- title of chat window
    footer = nil, -- footer of chat window
    zindex = 1, -- determines if window is on top or below other floating windows
  },
}
local map = vim.keymap.set
local function quick_chat()
      local input = vim.fn.input("Quick Chat: ")
      if input ~= "" then
        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
      end
end

map('n', "<leader>ccq", quick_chat, {desc = "CopilotChat - Quick chat" })
local function chat_actions()
    local actions = require("CopilotChat.actions")
    require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end

vim.api.nvim_create_user_command('Act', chat_actions, { range = true})
vim.api.nvim_create_user_command('Chat', ':CopilotChatToggle', { })
vim.api.nvim_create_user_command('ChatReset', ':CopilotChatReset', { })
