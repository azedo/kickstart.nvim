vim.filetype.add {
  pattern = {
    ['Podfile'] = 'ruby',
    ['Appfile'] = 'ruby',
    ['Matchfile'] = 'ruby',
    ['Pluginfile'] = 'ruby',
    ['Fastfile'] = 'ruby',
    ['.podspec'] = 'ruby',
  },
}
vim.filetype.add {
  pattern = {
    ['Podfile'] = 'ruby',
    ['Appfile'] = 'ruby',
    ['Matchfile'] = 'ruby',
    ['Pluginfile'] = 'ruby',
    ['Fastfile'] = 'ruby',
  },
}
vim.filetype.add {
  pattern = {
    ['Podfile'] = 'ruby',
    ['Appfile'] = 'ruby',
    ['Matchfile'] = 'ruby',
    ['Pluginfile'] = 'ruby',
    ['Fastfile'] = 'ruby',
  },
}

vim.keymap.set('n', '<leader>bd', function()
  local bufs = vim.api.nvim_list_bufs()
  local current_buf = vim.api.nvim_get_current_buf()
  for _, i in ipairs(bufs) do
    if i ~= current_buf then
      vim.api.nvim_buf_delete(i, {})
    end
  end
end, { desc = 'Delete all buffers but the one that is focused' })

-- oil fix copilot
vim.api.nvim_create_augroup('OilRelPathFix', {})
vim.api.nvim_create_autocmd('BufEnter', {
  group = 'OilRelPathFix',
  pattern = 'oil:///*',
  callback = function()
    vim.cmd 'Copilot disable'
  end,
})
vim.api.nvim_create_autocmd('BufLeave', {
  group = 'OilRelPathFix',
  pattern = 'oil:///*',
  callback = function()
    vim.cmd 'Copilot enable'
  end,
})
