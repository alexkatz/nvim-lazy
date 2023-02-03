return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update({ with_sync = true }))
    end,
    config = {
      ensure_installed = {
        'lua',
        'rust',
        'typescript',
        'help',
        'vim',
        'bash',
        'html',
        'javascript',
        'json',
        'markdown',
        'markdown_inline',
        'regex',
        'tsx',
        'typescript',
        'vim',
        'yaml',
      },
      auto_install = true,

      autotag = { enable = true },
      matchup = { enable = true },

      highlight = { enable = true },
      playground = { enable = true },
      indent = { enable = true, disable = { 'python' } },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-v>',
          node_incremental = '<C-v>',
          node_decremental = '<M-v>',
        },
      },

      rainbow = {
        enable = true,
        extended_mode = false,
        colors = {
          'Gold',
          'Orchid',
          'DodgerBlue',
        },
        disable = { 'html' },
      },
    },
  },

  -- rainbow braces, brackets
  'p00f/nvim-ts-rainbow',

  {
    'nvim-treesitter/playground',
    event = 'BufRead',
  },
  --  auto close and rename html/jsx tags
  'windwp/nvim-ts-autotag',
}
