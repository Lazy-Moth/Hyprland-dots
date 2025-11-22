local M = {}

M.auto_reload = function()
  -- Автоперезагрузка при сохранении chadrc.lua
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*/chadrc.lua",
    callback = function()
      vim.schedule(function()
        -- Перезагружаем NVChad
        require("plenary.reload").reload_module("chadrc")
        require("plenary.reload").reload_module("core.utils")
        
        -- Применяем новую тему
        require("base46").load_all_highlights()
        
        print("Тема перезагружена!")
      end)
    end,
  })
end

return M