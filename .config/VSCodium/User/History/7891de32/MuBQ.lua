local M = {}

function M.reload_theme()
  local current_theme = require("chadrc").ui.theme
  
  -- Перезагружаем необходимые модули
  require("plenary.reload").reload_module("chadrc")
  require("plenary.reload").reload_module("base46")
  require("plenary.reload").reload_module("core.utils")
  
  -- Загружаем тему заново
  local status, err = pcall(function()
    require("base46").load_all_highlights()
  end)
  
  if status then
    vim.notify("Тема успешно перезагружена: " .. current_theme, vim.log.levels.INFO)
  else
    vim.notify("Ошибка при перезагрузке темы: " .. tostring(err), vim.log.levels.ERROR)
  end
end

M.auto_reload_theme = function()
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*/chadrc.lua",
    callback = function()
      vim.defer_fn(function()
        M.reload_theme()
      end, 100)
    end,
  })
end

return M