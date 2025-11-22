#!/bin/bash

THEMES_DIR="$HOME/.config/colorschemes"
APPLY_SCRIPT="$HOME/.config/colorschemes/apply-theme.sh"

# Получаем список тем
THEMES=$(find "$THEMES_DIR" -maxdepth 1 -type d -printf '%f\n' | tail -n +2 | sort)

# Показываем rofi с правильным оформлением
SELECTED_THEME=$(echo "$THEMES" | rofi -dmenu \
    -p "🎨  Select Theme" \
    -theme-str '
        window {
            background-color: #1e1e2e;
            foreground: #cdd6f4;
            border-color: #cba6f7;
        }
        window {
            background-color: #1e1e2e;
            border: 2px;
            border-radius: 12px;
            padding: 20px;
            width: 30%;
        }
        inputbar {
            background-color: #181825;
            border-radius: 8px;
            padding: 8px;
            margin: 0px 0px 10px 0px;
        }
        listview {
            background-color: #1e1e2e;
            border-radius: 8px;
            padding: 8px;
            lines: 12;
            dynamic: true;
        }
        element {
            background-color: #1e1e2e;
            text-color: #cdd6f4;
            border-radius: 6px;
            padding: 8px;
            margin: 2px 0px;
        }
        element selected {
            background-color: #cba6f7;
            text-color: #1e1e2e;
        }
    ')

# Если тема выбрана, запускаем apply-theme.sh с этой темой
if [ -n "$SELECTED_THEME" ]; then
    "$APPLY_SCRIPT" "$SELECTED_THEME"
fi