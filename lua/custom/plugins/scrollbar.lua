return {
  {
    'petertriho/nvim-scrollbar',
    event = 'BufReadPre',
    config = function()
      require('scrollbar').setup {
        show_in_active_only = true,
        handlers = {
          diagnostic = true,
        },
      }

      require('scrollbar.handlers.diagnostic').setup()
    end,
  },
}
