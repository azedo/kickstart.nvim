return {
  'mbbill/undotree',
  config = function()
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.keymap.set({ 'n', 'v' }, '<leader>du', vim.cmd.UndotreeToggle, { desc = 'Toggle [u]ndotree' })
  end,
}
