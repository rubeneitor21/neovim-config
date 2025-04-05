require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-T>", function ()
  require("minty.huefy").open()
end, {})

map("n", "<leader>lf", ":lua vim.diagnostic.open_float(nil, {focus=true})<CR>", {desc = "LSP Floating diagnostics"})

map("n", "<leader>gtb", ":Gitsigns toggle_current_line_blame", {desc = "Toggle inline git blame"})
map("n", "<leader>gb", ":Gitsings blame", {desc = "Show aside git blame"})


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
