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

      setup = {
        eslint = function()
          vim.api.nvim_create_autocmd('BufWritePre', {
            callback = function(event)
              if require('lspconfig.util').get_active_client_by_name(event.buf, 'eslint') then
                vim.cmd('EslintFixAll')
              end
            end,
          })
        end,
      },
    },
  },
}
