local M = {
  "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
}

function M.config()
  local status_ok, devicons = pcall(require, "nvim-web-devicons")
  if not status_ok then
    return
  end

  local get_icon = require("utils.icons").get_icon

  devicons.setup {
    override = {
      zsh = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh",
      },
    },
    color_icons = true,
    default = true,
    override_by_filename = {
      ["go.sum"] = {
        icon = "",
        color = "#126B81",
        name = "go",
      },
      ["go.mod"] = {
        icon = "",
        color = "#126B81",
        name = "go",
      },
      [".gitignore"] = {
        icon = get_icon "Git",
        color = "#f1502f",
        name = "Gitignore",
      },
      [".gitkeep"] = {
        icon = get_icon "Git",
        color = "#f1502f",
        name = "Gitignore",
      },
      [".luacheckrc"] = {
        icon = get_icon "Lua",
        color = "#51A0CF",
        name = "Luacheck",
      },
      [".eslintrc.json"] = {
        icon = get_icon "Eslint",
        color = "#4b32c3",
        name = "Eslintrc",
      },
      [".eslintignore"] = {
        icon = get_icon "Eslint",
        color = "#4b32c3",
        name = "Eslintignore",
      },
      [".env.example"] = {
        icon = get_icon "Env",
        color = "#fcf003",
        name = "Env_example",
      },
      [".env.production"] = {
        icon = get_icon "Env",
        color = "#fcf003",
        name = "Env_prod",
      },
      [".env.development"] = {
        icon = get_icon "Env",
        color = "#fcf003",
        name = "Env_dev",
      },
      [".aidigestignore"] = {
        icon = get_icon "AI",
        color = "#5e25cf",
        name = "AiDigest",
      },
      ["docker-compose.prod.yml"] = {
        icon = get_icon "Docker",
        color = "#007acc",
        name = "DockerComposeProd",
      },
      ["docker-compose.dev.yml"] = {
        icon = get_icon "Docker",
        color = "#007acc",
        name = "DockerComposeDev",
      },
    },
    override_by_extension = {
      ["json"] = {
        icon = get_icon "Json",
        color = "#fcf003",
        name = "JSON",
      },
      ["java"] = {
        icon = get_icon "Coffe",
        color = "#FB1A00",
        name = "Java",
      },
      ["class"] = {
        icon = get_icon "Coffe",
        color = "#4A61EA",
        name = "Java_bytecode",
      },
      ["js"] = {
        icon = get_icon "Javascript",
        color = "#F0DB4F",
        name = "Javascript",
      },
      ["mjs"] = {
        icon = get_icon "Javascript",
        color = "#F0DB4F",
        name = "Michael_Jackson_script",
      },
      ["ts"] = {
        -- FIX: Icon small
        icon = get_icon "Typescript",
        color = "#007acc",
        name = "Typescript",
      },
      ["astro"] = {
        icon = get_icon "Astro",
        color = "#FF6900",
        name = "Astro",
      },
      ["hbs"] = {
        icon = get_icon "Mustache",
        color = "#FF6900",
        name = "handlebars",
      },
    },
  }
end

return M
