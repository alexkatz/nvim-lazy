return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'HiPhish/nvim-ts-rainbow2',
      'windwp/nvim-ts-autotag',
    },
    build = function()
      pcall(require('nvim-treesitter.install').update({ with_sync = true }))
    end,
    opts = {
      ensure_installed = {
        'lua',
        'rust',
        'typescript',
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
      highlight = { enable = true, additional_vim_regex_highlighting = false },
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
      },
    },
  },
}
