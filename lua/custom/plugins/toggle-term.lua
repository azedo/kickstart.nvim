return {
  'akinsho/toggleterm.nvim',
  event = 'VimEnter',

  --   { "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", desc = "Toggle Term" },
  --   { "<leader>ta", "<cmd>ToggleTermToggleAll<CR>",        desc = "Toggle Term All" },
  -- },
  version = '*',
  opts = { --[[ things you want to change go here]]
    open_mapping = [[\\]],
    terminal_mappings = true,
  },
  config = function()
    -- lazygit with toggle term
    local Terminal = require('toggleterm.terminal').Terminal

    local regularTerm = Terminal:new {
      hidden = true,
      direction = 'horizontal',
      size = 100,
      -- vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>lua regular_term()<CR>', { noremap = true, silent = true, desc = 'Open [t]erminal view' }),
      on_open = function()
        vim.cmd 'startinsert!'
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { buffer = 0 })
      end,
    }

    local floatTerm = Terminal:new {
      hidden = true,
      direction = 'float',
      size = 100,
      -- vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>lua regular_term()<CR>', { noremap = true, silent = true, desc = 'Open [t]erminal view' }),
      on_open = function()
        vim.cmd 'startinsert!'
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { buffer = 0 })
      end,
    }

    local lazygit = Terminal:new {
      cmd = 'lazygit',
      dir = 'git_dir',
      direction = 'float',
      float_opts = {
        border = 'double',
      },
      -- function to run on opening the terminal
      -- on_open = function(term)
      --   vim.cmd("startinsert!")
      --   vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      -- end,
    }

    function lazygit_toggle()
      lazygit:toggle()
    end

    function regular_term()
      regularTerm:toggle()
    end

    function float_term()
      floatTerm:toggle()
    end

    vim.keymap.set({ 'n', 'v' }, '<leader>gl', '<cmd>lua lazygit_toggle()<CR>', { noremap = true, silent = true, desc = 'Open [g]it [l]azygit window' })
    vim.keymap.set({ 'n', 'v' }, '<leader>tt', '<cmd>lua regular_term()<CR>', { noremap = true, silent = true, desc = 'Open [t]erminal bottom view' })
    vim.keymap.set({ 'n', 'v' }, '<leader>tf', '<cmd>lua float_term()<CR>', { noremap = true, silent = true, desc = 'Open [t]erminal [f]loat view' })
  end,
}
