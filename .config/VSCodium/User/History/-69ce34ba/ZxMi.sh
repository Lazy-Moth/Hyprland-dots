#!/bin/bash

THEMES_DIR="$HOME/.config/colorschemes"
APPLY_SCRIPT="$HOME/.config/colorschemes/apply-theme.sh"

# Получаем список тем
THEMES=$(find "$THEMES_DIR" -maxdepth 1 -type d -printf '%f\n' | tail -n +2 | sort)

# Показываем rofi с вашим дизайном
SELECTED_THEME=$(echo "$THEMES" | rofi -dmenu \
    -p "     Select Theme" \
    -theme-str '
* {
    font: "JetBrainsMono Nerd Font 12";
    background: #1e1e2eE6;        /* полупрозрачный фон */
    foreground: #cdd6f4;          /* основной текст */
    selected: #89b4fa;            /* выделение */
    border: 0;
    border-radius: 12px;
    padding: 12px;
}

window {
    width: 480px;
    border: 0;
    border-radius: 16px;
    background-color: @background;
}

mainbox {
    children: [inputbar, listview];
    spacing: 10px;
    padding: 16px;
}

inputbar {
    background-color: #313244;
    text-color: @foreground;
    padding: 8px 12px;
    border-radius: 10px;
    spacing: 8px;
}

entry {
    placeholder: "Search themes...";
    text-color: @foreground;
    background-color: transparent;
}

listview {
    spacing: 6px;
    lines: 10;
    columns: 1;
    fixed-height: false;
}

element {
    padding: 8px 12px;
    border-radius: 8px;
    background-color: transparent;
    text-color: @foreground;
}

element selected {
    background-color: #45475a;
    text-color: @selected;
}

element-text {
    vertical-align: 0.5;
}

textbox {
    background-color: transparent;
    text-color: @foreground;
}
')

# Если тема выбрана, запускаем apply-theme.sh с этой темой
if [ -n "$SELECTED_THEME" ]; then
    "$APPLY_SCRIPT" "$SELECTED_THEME"
fi