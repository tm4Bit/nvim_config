local M = {
  "goolord/alpha-nvim",
}

function M.config()
  local alpha_status_ok, alpha = pcall(require, "alpha")
  if not alpha_status_ok then
    return
  end

  local dashboard_status_ok, dashboard = pcall(require, "alpha.themes.dashboard")
  if not dashboard_status_ok then
    return
  end

  dashboard.section.header.val = {
    "",
    "",
    "",
    "",
    "",
    "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
    "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
    "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
    "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
    "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
    "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
    "v0.10.1",
    "",
  }

  local button = require("utils.alpha-helper").alpha_button
  local get_icon = require("utils.icons").get_icon

  dashboard.section.buttons.val = {
    button("LDR f f", get_icon("FindFile", 1) .. " Find file"),
    button("LDR f w", get_icon("FindText", 1) .. " Find text"),
    button("LDR   C", get_icon("Gear", 1) .. " Configuration"),
    button("LDR   q", get_icon("Quit", 1) .. " Quit"),
  }

  dashboard.section.header.opts.hl = "AlphaHeader"
  -- dashboard.section.buttons.opts.hl = "@boolean"

  dashboard.opts.opts.noautocmd = true
  alpha.setup(dashboard.opts)
end

return M
