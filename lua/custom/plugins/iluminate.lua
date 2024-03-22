return {
  'RRethy/vim-illuminate',
  event = 'BufReadPost',
  config = function()
    require('illuminate').configure {
      delay = 200,
      filetypes_denylist = {
        'NvimTree',
        'markdown',
        'fugitive',
        'oil',
      },
      providers = {
        'treesitter',
        'lsp',
        'regex',
      },
      modes_allowlist = { 'n' },
      min_count_to_highlight = 2,
    }
    -- vim.cmd [[hi IlluminatedWordText guibg=#a7c080 guifg=#424c33 gui=nocombine]]
    -- vim.cmd [[hi IlluminatedWordWrite guibg=#a7c080 guifg=#424c33 gui=nocombine]]
    -- vim.cmd [[hi IlluminatedWordRead guibg=#a7c080 guifg=#424c33 gui=nocombine]]
    -- vim.cmd [[hi IlluminatedWordText guibg=#ff71ce]]
    -- vim.cmd [[hi IlluminatedWordRead  guibg=#ff71ce]]
    -- vim.cmd [[hi IlluminatedWordWrite guibg=#ff71ce]]
  end,
}
