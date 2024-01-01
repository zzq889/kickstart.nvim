-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function ()
    local project_tree = function()
      local builtin = require('neo-tree.command')

      local is_git_repo = vim.fn.systemlist("git rev-parse --is-inside-work-tree")[1] == "true"
      if is_git_repo then
        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        builtin.execute({ toggle = true, dir = git_root })
      else
        builtin.execute({ toggle = true, dir = vim.loop.cwd() })
      end
    end
    vim.keymap.set('n', '<leader>tt', project_tree, { desc = '[T]oggle [T]ree' })

    require('neo-tree').setup {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
    }
  end,
}
