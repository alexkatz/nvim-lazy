return {
  'echasnovski/mini.files',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      use_as_default_explorer = true,
    },
    windows = {
      preview = true,
      width_nofocus = 40,
      width_focus = 40,
      width_preview = 100,
    },
  },
  keys = {
    {
      '<leader>e',
      function()
        require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = 'Open mini.files (directory of current file)',
    },
    {
      '<leader>E',
      function()
        require('mini.files').open(vim.loop.cwd(), true)
      end,
      desc = 'Open mini.files (cwd)',
    },
    {
      '<esc>',
      function()
        require('mini.files').close()
      end,
      desc = 'Close mini.files',
    },
  },
}
