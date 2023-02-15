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

    keys = {
      { '<leader>gc', false },
      { '<leader>gs', false },
      { '<leader>su', '<cmd>Telescope undo<cr>', desc = 'Search Undo History' },
      { '<leader>sR', '<cmd>Telescope resume<cr>', desc = 'Resume Search' },
      { '<leader>fR', '<cmd>Telescope resume<cr>', desc = 'Resume Search' },
    },

    opts = function(_, opts)
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

      opts.pickers = {
        lsp_references = { show_line = false },
      }

      opts.defaults.layout_strategy = 'vertical'

      opts.defaults.layout_config = {
        mirror = true,
      }

      opts.defaults.mappings.i['<C-q>'] = actions.smart_add_to_qflist + actions.open_qflist
      opts.defaults.mappings.i['<cr>'] = actions.select_default
      opts.defaults.mappings.i['<esc>'] = actions.close
      opts.defaults.mappings.i['<C-j>'] = actions.move_selection_next
      opts.defaults.mappings.i['<C-k>'] = actions.move_selection_previous

      opts.defaults.mappings.i['<C-n>'] = function(...)
        actions.results_scrolling_down(...)
      end

      opts.defaults.mappings.i['<C-p>'] = function(...)
        actions.results_scrolling_up(...)
      end
    end,
  },
}
