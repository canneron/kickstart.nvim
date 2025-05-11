vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = function()
    vim.keymap.set('n', '<leader>g', function()
      local filename = vim.fn.expand '%:t'
      vim.cmd 'vsplit'
      vim.cmd 'wincmd l'
      vim.cmd('term go build ' .. filename)
      vim.cmd 'startinsert'
    end, { buffer = true, desc = 'Run go build <filename>' })
  end,
})

return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true, -- format code using gofumpt (stricter gofmt)
              staticcheck = true, -- enable additional diagnostics/linting
              analyses = {
                unusedparams = true,
                unreachable = true,
                fieldalignment = true,
              },
            },
          },
        },
      },
    },
  },

  -- Optional: format Go files on save using gopls (built-in formatter)
  {
    'nvim-lua/plenary.nvim', -- required dependency for the next auto-command
    config = function()
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.go',
        callback = function()
          vim.lsp.buf.format { async = false }
        end,
      })
    end,
  },
}
