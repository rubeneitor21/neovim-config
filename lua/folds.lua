-- Función personalizada para combinar treesitter + regiones
function _G.CustomFoldExpr()
  local line = vim.fn.getline(vim.v.lnum)

  -- Detectar regiones personalizadas (estilo //#region y //#endregion)
  if line:match("#region") then
    return "a1" -- Nivel alto para abrir regiones
  elseif line:match("#endregion") then
    return "s1" -- Cierra el fold
  else
    return "="
  end

  -- return line
  -- Usa el fold de Treesitter si no es una región
end

