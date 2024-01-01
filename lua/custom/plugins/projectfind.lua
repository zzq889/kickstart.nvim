local utils = require('telescope.utils')
local telescope_builtin = require('telescope.builtin')

local project_files = function()
  local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
  if ret == 0 then
    local opts = {}
    opts.cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    telescope_builtin.find_files(opts)
  else
    telescope_builtin.find_files()
  end
end

vim.keymap.set('n', '<C-p>', project_files, { desc = '[P]roject [F]iles' })

return {}
