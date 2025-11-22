return {
    "nvim-lua/plenary.nvim",
    config = function()
        local reload_theme = function()
            -- Полная перезагрузка NVChad конфигурации
            require("plenary.reload").reload_module("chadrc")
            require("plenary.reload").reload_module("base46")
            require("plenary.reload").reload_module("core.default_config")
            
            -- Применяем изменения
            local ok, result = pcall(function()
                require("base46").load_all_highlights()
            end)
            
            if ok then
                vim.notify("✅ Тема перезагружена!", vim.log.levels.INFO)
            else
                vim.notify("❌ Ошибка: " .. tostring(result), vim.log.levels.ERROR)
            end
        end

        -- Автокоманда
        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = "*/chadrc.lua",
            callback = reload_theme,
        })
        
        -- Команда для ручной перезагрузки
        vim.api.nvim_create_user_command("ReloadTheme", reload_theme, {})
    end
}