return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- keys = {
  --   {
  --     '<leader>ft',
  --     '<cmd>Oil<CR>',
  --     desc = 'Open [f]ile [t]ree (Oil)',
  --   },
  -- },
  config = function()
    local oil = require 'oil'

    oil.setup {
      default_file_explorer = false,
      columns = {
        'icon',
        -- 'permissions',
        -- 'size',
        -- 'mtime',
      },
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>f-', function()
      oil.toggle_float()
    end, { desc = 'Open [f]loating [-] file tree (Oil)' })
    vim.keymap.set({ 'n', 'v' }, '<leader>-', function()
      oil.open()
    end, { desc = 'Open [-] file tree (Oil)' })
  end,
}
