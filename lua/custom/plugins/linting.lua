return {
  'mfussenegger/nvim-lint',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      svelte = { 'eslint_d' },
      swift = { 'swiftlint' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({
      'BufEnter',
      'BufWritePost',
      'InsertLeave',
    }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set('n', '<leader>ll', function()
      lint.try_lint()
    end, { desc = 'Trigger [l]inting for current fi[l]e' })

    -- Shortcut for eslint --fix
    vim.keymap.set('n', '<leader>lf', function()
      local bufnr = vim.api.nvim_get_current_buf()
      local filename = vim.api.nvim_buf_get_name(bufnr)
      local eslint_d_bin = '/Users/eduardogrigolo/.local/share/nvim/mason/bin/eslint_d'

      vim.fn.system(eslint_d_bin .. ' --fix ' .. filename)
      vim.cmd 'edit!' -- to reload the file
      vim.cmd 'write' -- to save the file
    end, { desc = 'Trigger [l]inting auto [f]ix and save current file using eslint' })
  end,
}
