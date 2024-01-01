return {
  'mrjones2014/smart-splits.nvim',
  dependencies = {
    { 'kwkarlwang/bufresize.nvim', config = true }
  },

  config = function()
    -- recommended mappings
    -- resizing splits
    -- these keymaps will also accept a range,
    -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
    vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
    vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
    vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
    vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
    -- moving between splits
    vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
    vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
    vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
    vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
    -- swapping buffers between windows
    vim.keymap.set('n', '<C-w>H', require('smart-splits').swap_buf_left)
    vim.keymap.set('n', '<C-w>J', require('smart-splits').swap_buf_down)
    vim.keymap.set('n', '<C-w>K', require('smart-splits').swap_buf_up)
    vim.keymap.set('n', '<C-w>L', require('smart-splits').swap_buf_right)

    require('smart-splits').setup({
      ignored_buftypes = {
        'neo-tree',
        'DiffviewFiles',
      },

      resize_mode = {
        hooks = {
          on_leave = require('bufresize').register,
        },
      },
    })
  end,
}
