-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig

local WindowsTheme = {
  theme = "catppuccin",
  transparency = true,
  hl_override = {
    Visual = {
      bg = { "blue", -20 },
    },

    NonText = {fg = "#8AB6D6"},

    IblScopeChar = { fg = "blue" },

    ["@comment"] = { fg = { "blue", -10 } }
  },
}

local LinuxTheme = {
  theme = "chadracula",
  transparency = true,
  hl_override = {
    Visual = {
      bg = { "purple", -10 },
      -- reverse = true
    },

    NonText = {fg = "#D28FB3"},

    IblScopeChar = { fg = "pink" },

    -- ["@comment"] = { fg = "#990088" }
    ["@comment"] = { fg = { "purple", -20 } }
  },
}

local function getOsTheme()
  if (vim.loop.os_uname().sysname == "Windows_NT")
  then
    return WindowsTheme
  else
    return LinuxTheme
  end
end

local theme_os = getOsTheme()

local M = {}

M.nvdash = {
  load_on_startup = true,

  -- header = {
  --   "           ▄ ▄                   ",
  --   "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
  --   "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
  --   "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
  --   "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
  --   "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
  --   "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
  --   "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
  --   "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
  --   "                                 ",
  -- },
  --
  header = {
    "    ██████████████████    ",
    "  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██  ",
    "██▒▒    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██",
    "██▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██",
    "██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██",
    "██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██",
    "  ██████████████████████  ",
    "      ██▒▒██▒▒██▒▒██      ",
    "    ██▒▒████▒▒████▒▒██    ",
    "    ██▒▒████▒▒████▒▒██    ",
    "  ██▒▒██  ██▒▒██  ██▒▒██  ",
    "    ██    ██▒▒██    ██    ",
    "            ██            ",
    "                          "
  }

  -- buttons = {
  --   { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
  --   -- { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
  --   -- { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
  --   -- { "  Bookmarks", "Spc m a", "Telescope marks" },
  --   -- { "  Themes", "Spc t h", "Telescope themes" },
  --   -- { "  Mappings", "Spc c h", "NvCheatsheet" },
  -- },
}

M.base46 = theme_os

return M
