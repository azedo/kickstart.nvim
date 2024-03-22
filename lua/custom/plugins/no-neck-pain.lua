return {
  'shortcuts/no-neck-pain.nvim',
  event = 'VimEnter',
  keys = {
    { '<leader>nn', '<cmd>NoNeckPain<CR>', desc = 'Toggle NoNeckPain' },
  },
  config = function()
    require('no-neck-pain').setup {
      width = 150,
      buffers = {
        right = {
          enabled = false,
        },
        colors = {
          background = '#2a273f',
          text = '#ffffff',
        },
        scratchPad = {
          -- set to `false` to
          -- disable auto-saving
          enabled = true,
          -- set to `nil` to default
          -- to current working directory
          -- location = '~/Documents/VimScratchPad',
          location = nil,
        },
        bo = {
          filetype = 'md',
        },
      },
    }
  end,
}
