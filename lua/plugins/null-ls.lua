return {
  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = function(_, opts)
      local null_ls = require('null-ls')
      local sources_to_install = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.beautysh,
        null_ls.builtins.formatting.yamlfmt,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.diagnostics.cpplint,
      }

      for _, source in ipairs(sources_to_install) do
        table.insert(opts.sources, source)
      end
    end,
    keys = {
      { '<leader>cn', '<cmd>NullLsInfo<cr>', desc = 'NullLs Info' },
    },
  },
}
