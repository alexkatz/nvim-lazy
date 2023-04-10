return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectory = { mode = 'auto' },
          },
        },
        tailwindcss = {
          handlers = {
            ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers['textDocument/hover'], {
              silent = true,
            }),
          },
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
        clangd = {
          capabilities = {
            offsetEncoding = 'utf-8',
          },
        },
      },
    },
  },
}
