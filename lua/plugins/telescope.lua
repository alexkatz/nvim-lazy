return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      -- fzf
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        config = function()
          require('telescope').load_extension('fzf')
        end,
      },

      -- undo
      {
        'debugloop/telescope-undo.nvim',
        config = function()
          require('telescope').load_extension('undo')
        end,
      },
    },

    opts = function(_, opts)
      print('telescope options')
      local actions = require('telescope.actions')
      opts.extensions = {
        undo = {
          side_by_side = true,
          layout_strategy = 'vertical',
          layout_config = {
            preview_height = 0.8,
          },
        },
      }

      vim.keymap.set(
        'n',
        '<leader>su',
        '<cmd>Telescope undo<cr>',
        { noremap = true, silent = true, desc = 'Search Undo History' }
      )

      opts.defaults.mappings = {
        i = {
          ['<esc>'] = actions.close,
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
          ['<CR>'] = actions.select_default,
        },
      }
    end,
  },
}
