local M = {}

---@param mode string | table The mode(s) that the command will be executed
---@param map string The keymap to be executed by the user
---@param execute string | function The command or function to be executed
---@param opts? table vim.keymap.set option table
M.map = function(mode, map, execute, opts)
  vim.keymap.set(mode, map, execute, opts)
end

return M
