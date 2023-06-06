return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {

      {
        's1n7ax/nvim-window-picker',
        opts = {

          autoselect_one = true,
          include_current = false,
          filter_rules = {
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },

              -- if the buffer type is one of following, the window will be ignored
              buftype = { 'terminal', 'quickfix' },
            },
          },
          other_win_hl_color = '#e35e4f',
        },
        config = function() end,
      },
    },
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
          ['<C-v>'] = 'open_vsplit',
          ['s'] = 'noop',
          ['S'] = 'noop',
          ['/'] = 'noop',
          ['?'] = 'noop',
          ['g?'] = { 'show_help', desc = 'Show Neo-Tree help' },
          ['<esc>'] = 'noop',
          ['z'] = 'noop',
          ['W'] = 'close_all_nodes',
        },
      },
      filesystem = {
        follow_current_file = true,
      },
    },

    keys = {
      { '<leader>E', '<cmd>Neotree focus<cr>', desc = 'Focus Neotree' },
    },
  },
}
