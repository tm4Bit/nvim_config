local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "mm",
      function()
        require("harpoon"):list():add()
      end,
      desc = "[HARPOON]:This file",
    },
    {
      "<tab>",
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "[HARPOON]:Open",
    },
    {
      "<localleader>a",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "[HARPOON]:1",
    },
    {
      "<localleader>s",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "[HARPOON]:2",
    },
    {
      "<localleader>d",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "[HARPOON]:3",
    },
    {
      "<localleader>f",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "[HARPOON]:4",
    },
    {
      "<localleader>q",
      function()
        require("harpoon"):list():select(5)
      end,
      desc = "[HARPOON]:5",
    },
    {
      "<localleader>w",
      function()
        require("harpoon"):list():select(6)
      end,
      desc = "[HARPOON]:6",
    },
    {
      "<localleader>e",
      function()
        require("harpoon"):list():select(7)
      end,
      desc = "[HARPOON]:7",
    },
    {
      "<localleader>r",
      function()
        require("harpoon"):list():select(8)
      end,
      desc = "[HARPOON]:8",
    },
    {
      "[h",
      function()
        require("harpoon"):list():prev()
      end,
      desc = "[HARPOON]:prev",
    },
    {
      "]h",
      function()
        require("harpoon"):list():next()
      end,
      desc = "[HARPOON]:next",
    },
  },
  opts = {},
}

return M
