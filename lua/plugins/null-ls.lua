return {
  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = function()
      local null_ls = require('null-ls')
      return {
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.rustywind,
          null_ls.builtins.formatting.rustfmt,
          null_ls.builtins.formatting.beautysh,
          null_ls.builtins.formatting.yamlfmt,
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.diagnostics.cpplint,
        },
      }
    end,
    keys = {
      { '<leader>cn', '<cmd>NullLsInfo<cr>', desc = 'NullLs Info' },
    },
  },
}
