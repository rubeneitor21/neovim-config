-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig

local WindowsTheme = {
  theme = "rosepine",
  transparency = true,
  hl_override = {
    Visual = {
      bg = "#bf2f60" ,
    },

    NonText = {fg = "#ff3e80"},

    IblScopeChar = { fg = {"pink", -10} },

    ["@comment"] = { fg = { "pink", -10 } }
  },
}

-- Rosas
-- https://htmlcolorcodes.com/colors/shades-of-pink/

local LinuxTheme = {
  theme = "chadracula",
  -- theme = "rosepine"
  transparency = true,
  hl_override = {
    Visual = {
      -- bg = { "purple", -10 },
      bg = "#E78284"
      -- fg = "red"
      -- reverse = true
    },

    NonText = {fg = "#D28FB3"},

    IblScopeChar = { fg = "pink" },
  
    ["@ibl.scope.char.1"] = {fg = "red"},

    NvimTreeFolderName = {fg="#AA336A"},
    NvimTreeOpenedFolderName = {fg="#AA336A"},
    NvimTreeFolderIcon = {fg="#AA336A"},
    NvimTreeFolderArrowOpen = {fg="#AA336A"},

    -- ["@variable"] = { fg = "#DE3163"},
    ["@variable"] = {fg = "#FFB6C1"},

    ["@comment"] = { fg = "#AA336A" }
    -- ["@comment"] = { fg = { "purple", -20 } }
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

M.ui = theme_os
M.base46 = theme_os

return M
