vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

local path = "/run/user/1000/nvim_server"

local function read()
  local ok, data = pcall(vim.fn.readfile, path)
  if ok and data and data[1] then
    return data[1]
  end
end

local function alive(sock)
  if not sock or sock == "" then
    return false
  end
  local ok, chan = pcall(vim.fn.sockconnect, "pipe", sock, { rpc = true })
  if ok and chan and chan > 0 then
    vim.fn.chanclose(chan)
    return true
  end
  return false
end

local function current()
  return vim.v.servername ~= "" and vim.v.servername or nil
end

local function ensure()
  local saved = read()

  -- si el guardado sigue vivo → no tocar nada
  if alive(saved) then
    return
  end

  -- si no hay guardado vivo → usar este NVim
  local cur = current()
  if not cur then
    local list = vim.fn.serverlist()
    cur = list[1]
  end

  if cur and cur ~= "" then
    vim.fn.writefile({ cur }, path)
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.defer_fn(ensure, 20)
  end,
})

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

require("custom.gitsigns")

vim.schedule(function()
  require "mappings"
end)

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.CustomFoldExpr()"

vim.opt.foldlevel = 99

require("folds")

-- os.execute("git pull")
