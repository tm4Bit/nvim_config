local M = {}

-- Icons
local get_icon = require("utils.icons").get_icon

M.check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

M.border_opts = {
  -- border = "single",
  border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
}

M.kind_icons = {
  -- TODO: Add Array and Boolean icons
  Array = get_icon "Array",
  Boolean = get_icon "Boolean",
  Text = get_icon "Text",
  Method = get_icon "Method",
  Function = get_icon "Function",
  Constructor = get_icon "Constructor",
  Field = get_icon "Field",
  Variable = get_icon "Variable",
  Class = get_icon "Class",
  Interface = get_icon "Interface",
  Module = get_icon "Module",
  Property = get_icon "Property",
  Unit = get_icon "Unit",
  Value = get_icon "Value",
  Enum = get_icon "Enum",
  Keyword = get_icon "Keyword",
  Snippet = get_icon "Snippet",
  Color = get_icon "Color",
  File = get_icon "File",
  Reference = get_icon "Reference",
  Folder = get_icon "Folder",
  EnumMember = get_icon "EnumMember",
  Constant = get_icon "Constant",
  Struct = get_icon "Struct",
  Event = get_icon "Event",
  Operator = get_icon "Operator",
  TypeParameter = get_icon "TypeParameter",
  Codeium = get_icon "Codeium",
  Copilot = get_icon "Copilot",
}

return M
