-- local hooks = require "ibl.hooks"
--
-- -- Define los colores para la indentación actual y los niveles restantes
-- local highlight = {
--     "IndentBlanklineContext",  -- Se usa para la indentación actual
--     "IndentBlanklineIndent1",   -- Se puede usar para el resto, pero lo dejaremos por defecto
-- }
--
-- -- Crear grupos de resaltado
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--     -- Resalta la indentación actual
--     vim.api.nvim_set_hl(0, "IndentBlanklineContext", { fg = "#FFA500" })  -- Color para la indentación actual
--     -- Mantener los demás niveles en gris por defecto (puedes ajustar según necesites)
--     vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = "#4B5263" })  -- Color gris por defecto
--     vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = "#FFA500" })  -- Gris para el segundo nivel
--     vim.api.nvim_set_hl(0, "IndentBlanklineIndent3", { fg = "#4B5263" })  -- Gris para el tercer nivel
-- end)
--
-- -- Configuración del plugin
-- require("ibl").setup {
--     indent = {
--         char = "│",  -- Carácter para la línea de indentación
--         highlight = highlight,  -- Usar los grupos de resaltado definidos arriba
--     },
--     scope = {
--         enabled = true,  -- Habilitar la visualización del scope actual
--         show_start = true,
--         show_end = false,
--     },
-- }
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}
local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#C200CC" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup { scope = { highlight = highlight } }

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
