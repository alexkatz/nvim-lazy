return {
  'echasnovski/mini.files',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  opts = function(_, opts)
    opts.options = {
      use_as_default_explorer = true,
    }

    opts.windows = {
      preview = true,
      width_nofocus = 40,
      width_focus = 40,
      width_preview = 100,
    }
  end,
  config = function(_, opts)
    local MiniFiles = require('mini.files')
    MiniFiles.setup(opts)

    local map_split = function(buf_id, lhs, direction)
      local rhs = function()
        -- Make new window, set it as target, close
        local current_target_window = MiniFiles.get_target_window()
        if not current_target_window then
          return
        end

        vim.api.nvim_win_call(current_target_window, function()
          vim.cmd(direction .. ' split')
          MiniFiles.set_target_window(vim.api.nvim_get_current_win())
        end)

        MiniFiles.close()
      end

      -- Adding `desc` will result into `show_help` entries
      local desc = 'Split ' .. direction

      vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf_id = args.data.buf_id
        map_split(buf_id, 'gh', 'belowright horizontal')
        map_split(buf_id, 'gv', 'belowright vertical')
      end,
    })
  end,
  keys = {
    {
      '<leader>e',
      function()
        require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = 'Open mini.files ',
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
