return {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim", "spec" } },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
        checkThirdParty = false,
      },
      telemetry = { enable = false },
      hint = {
        enable = true,
        arrayIndex = "Disable", -- Copied from your lua/settings/lua_ls.lua
        await = true,
        paramName = "All",
        paramType = false,
        semicolon = "All",
        setType = false,
      },
      format = { enable = false }, -- From your lua/settings/lua_ls.lua
    },
  },
}
