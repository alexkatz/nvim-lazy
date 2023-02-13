return {
  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = function()
      local nls = require('null-ls')
      return {
        sources = {
          nls.builtins.formatting.prettier,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.rustywind,
          nls.builtins.formatting.rustfmt,
          nls.builtins.formatting.beautysh,
          nls.builtins.formatting.yamlfmt,
        },
      }
    end,
    keys = {
      { '<leader>cn', '<cmd>NullLsInfo<cr>', desc = 'NullLs Info' },
    },
  },
}
