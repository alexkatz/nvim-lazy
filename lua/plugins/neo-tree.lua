return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    opts = {
      sources = {
        'filesystem',
        'buffers',
      },
      close_if_last_window = true,
      window = {
        mappings = {
          ['l'] = 'open',
          ['L'] = 'focus_preview',
          ['h'] = 'close_node',
        },
      },
      filesystem = {
        follow_current_file = true,
      },
    },
  },
  {
    's1n7ax/nvim-window-picker',
  },
}
