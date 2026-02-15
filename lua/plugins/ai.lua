return {
  "nickjvandyke/opencode.nvim",
  dependencies = {
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    vim.g.opencode_opts = {
      -- Your configuration, if any.
    }

    vim.o.autoread = true

    local map = require("utils.map").map

    local opencode = require("opencode")

    map({ "n", "x" }, "<localleader>oc", function() opencode.ask("@this: ", { submit = true }) end, { desc = "[OPENCODE] Ask opencode" })
    map({ "n", "x" }, "<localleader>ox", function() opencode.select() end, { desc = "[OPENCODE] Execute opencode action…" })
    map({ "n", "t" }, "<localleader>ot", function() opencode.toggle() end, { desc = "[OPENCODE] Toggle opencode" })
    map({ "n", "x" }, "go", function() return opencode.operator "@this " end, { desc = "[OPENCODE] Add range to opencode", expr = true })
    map("n", "goo", function() return opencode.operator "@this " .. "_" end, { desc = "[OPENCODE] Add line to opencode", expr = true })
    map("n", "<S-C-u>", function() opencode.command "session.half.page.up" end, { desc = "[OPENCODE] Scroll opencode up" })
    map("n", "<S-C-d>", function() opencode.command "session.half.page.down" end, { desc = "[OPENCODE] Scroll opencode down" })

    vim.keymap.set("n", "+", "<localleader>oc", { desc = "[OPENCODE] Increment under cursor", noremap = true })
    vim.keymap.set("n", "-", "<localleader>od", { desc = "[OPENCODE] Decrement under cursor", noremap = true })
  end,
}
