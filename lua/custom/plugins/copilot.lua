return {
  'zbirenbaum/copilot.lua',
  event = 'InsertEnter',
  cmd = 'Copilot',
  opts = {
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = '<c-y>',
        accept_line = '<M-l>',
        accept_word = '<M-k>',
        next = '<M-]>',
        prev = '<M-[>',
        dismiss = '<M-c>',
      },
    },
  },
}
