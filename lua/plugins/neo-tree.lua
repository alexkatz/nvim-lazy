return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
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
      default_component_configs = {
        icon = {
          folder_empty = '󰜌',
          folder_empty_open = '󰜌',
        },
        git_status = {
          symbols = {
            renamed = '󰁕',
            unstaged = '󰄱',
          },
        },
      },
      document_symbols = {
        kinds = {
          File = { icon = '󰈙', hl = 'Tag' },
          Namespace = { icon = '󰌗', hl = 'Include' },
          Package = { icon = '󰏖', hl = 'Label' },
          Class = { icon = '󰌗', hl = 'Include' },
          Property = { icon = '󰆧', hl = '@property' },
          Enum = { icon = '󰒻', hl = '@number' },
          Function = { icon = '󰊕', hl = 'Function' },
          String = { icon = '󰀬', hl = 'String' },
          Number = { icon = '󰎠', hl = 'Number' },
          Array = { icon = '󰅪', hl = 'Type' },
          Object = { icon = '󰅩', hl = 'Type' },
          Key = { icon = '󰌋', hl = '' },
          Struct = { icon = '󰌗', hl = 'Type' },
          Operator = { icon = '󰆕', hl = 'Operator' },
          TypeParameter = { icon = '󰊄', hl = 'Type' },
          StaticMethod = { icon = '󰠄 ', hl = 'Function' },
        },
      },
      -- Add this section only if you've configured source selector.
      source_selector = {
        sources = {
          { source = 'filesystem', display_name = ' 󰉓 Files ' },
        },
      },
      sources = {
        'filesystem',
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
