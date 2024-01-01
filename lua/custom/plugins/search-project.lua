local utils = require('telescope.utils')
local telescope_builtin = require('telescope.builtin')

local search_project = function()
  local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
  if ret == 0 then
    local opts = {}
    opts.cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    telescope_builtin.find_files(opts)
  else
    telescope_builtin.find_files()
  end
end

vim.keymap.set('n', '<C-p>', search_project, { desc = '[S]earch [P]roject' })

return {}
