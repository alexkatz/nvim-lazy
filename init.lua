-- bootstrap lazy.nvim, LazyVim and your plugins
require('config.lazy')

vim.cmd([[colorscheme arctic]])

-- diffview
local open_diff_view = function()
  vim.ui.input({ prompt = 'Diff working tree with branch (leave blank for development): ' }, function(branch_name)
    require('diffview').open(string.len(branch_name) == 0 and 'development' or branch_name)
  end)
end

require('which-key').register({
  ['<leader>'] = {
    g = {
      name = '+Git Diffview',
      g = { '<Cmd>DiffviewOpen<CR>', 'Diff Workspace changes' },
      b = { open_diff_view, 'Diff Workspace with branch (Development if left blank)' },
      d = { '<Cmd>DiffviewClose<CR>', 'Close Diffview' },
      f = { '<Cmd>DiffviewFileHistory %<CR>', 'File history' },
    },
  },
})

vim.keymap.set(
  'n',
  '<leader>su',
  '<cmd>Telescope undo<cr>',
  { noremap = true, silent = true, desc = 'Search Undo History' }
)
