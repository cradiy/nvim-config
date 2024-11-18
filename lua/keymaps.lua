-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

local map = vim.keymap.set
vim.g.mapleader = " " -- 将 Leader 键设置为空格
vim.g.maplocalleader = " " -- 将本地 Leader 键设置为空格
-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Nvim Tree
vim.keymap.set('n', '<A-m>', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<A-e>', ':NvimTreeFocus<CR>', opts)
vim.keymap.set('n', '<A-r>', ':NvimTreeRefresh<CR>', opts)

-- vim.keymap.set('n', '<A-.>', ':NvimTreeFindFile<CR>', opts)

-- local builtin = require('telescope')
vim.keymap.set('n', '<leader>f', ":Telescope find_files<CR>", opts)
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- LSP 
vim.keymap.set("n", "<C-.>", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true })
map('n', '<leader>a', ':lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'rn', ':lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<leader>r', ':lua vim.lsp.buf.references()<CR>', opts)
map('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)

map('n', '<leader>j', '<cmd>Telescope jumplist<CR>', opts)
-- map('n', '<leader>r', '<cmd>lua ShowReferencesInFloatingWindow()<CR>', { noremap = true, silent = true })



map('n', '<leader>i', ':lua vim.lsp.buf.implementation()<CR>', opts)

-- Move to previous/next
map('n', '<C-;>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-\'>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
map('n', '<S-Up>', '', opts)
map('n', '<S-Down>', '', opts)




-- 在 Neovim 中定义自定义窗口导航快捷键
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-q>', '<C-w>q', { noremap = true, silent = true })
