-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- centers cursor on page up or page down
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- centers cursor on next/prev search
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true })

-- save, save all
vim.keymap.set({ 'i', 'v', 'n', 's' }, '<M-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })
vim.keymap.set({ 'i', 'v', 'n', 's' }, '<M-a>', '<cmd>wa<cr><esc>', { desc = 'Save file' })

-- Resize window using <ctrl> arrow keys
vim.keymap.set('n', '<M-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
vim.keymap.set('n', '<M-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<M-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<M-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

--  window/buffer
vim.api.nvim_del_keymap('n', '<leader>w|')
vim.api.nvim_del_keymap('n', '<leader>w-')
vim.api.nvim_del_keymap('n', '<leader>-')
vim.api.nvim_del_keymap('n', '<leader>|')

vim.keymap.set('n', '<leader>wv', '<C-W>v', { desc = 'Vertical Split' })
vim.keymap.set('n', '<leader>wh', '<C-W>s', { desc = 'Horizontal Split' })
vim.keymap.set('n', '<leader>wf', '<cmd>w<cr>', { desc = 'Save Buffer' })
vim.keymap.set('n', '<leader>wF', '<cmd>wa<cr>', { desc = 'Save All Buffers' })

vim.keymap.set('n', '<leader>wo', '<cmd>only<cr>', { desc = 'Close Other Windows' })

vim.keymap.set(
  'n',
  '<leader>bo',
  '<cmd>BufferLineCloseLeft<cr> <cmd>BufferLineCloseRight<cr>',
  { desc = 'Close Other Buffers' }
)

-- vim-surround cooperation
vim.keymap.set('v', 'S', '<Plug>VSurround', { noremap = true, silent = true })
