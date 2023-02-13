return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tailwindcss = {
          root_dir = require('lspconfig.util').root_pattern('.git'),
          flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  { 'classed(?:\\.\\w*)?\\(([^)]*)\\)', '["\'`]([^"\'`]*).*?["\'`]' },
                  { 'clsx\\(([^)]*)\\)', "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  '(?:[a-z]ClassName)=\\s*(?:"|\')([^(?:"|\')]*)',
                },
              },
            },
          },
        },
      },
    },
  },
}
