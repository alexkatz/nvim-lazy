return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tailwindcss = {
          handlers = {
            ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers['textDocument/hover'], {
              silent = true,
            }),
          },
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  { 'classed(?:\\.\\w*)?\\(([^)]*)\\)', '["\'`]([^"\'`]*).*?["\'`]' },
                  { 'twMerge\\(([^)]*)\\)', "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  { 'tw\\(([^)]*)\\)', "(?:'|\"|`)([^']*)(?:'|\"|`)" },
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
