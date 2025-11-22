#!/bin/bash

THEMES_DIR="$HOME/.config/colorschemes"
APPLY_SCRIPT="$HOME/.config/colorschemes/apply-theme.sh"

# Получаем список тем
THEMES=$(find "$THEMES_DIR" -maxdepth 1 -type d -printf '%f\n' | tail -n +2 | sort)

# Показываем rofi с вашим дизайном
SELECTED_THEME=$(echo "$THEMES" | rofi -dmenu \
    -p "🎨  Select Theme" \
    -theme-str '
configuration {
    font: "JetBrainsMono Nerd Font 12";
    show-icons: false;
    lines: 10;
    width: 40;
    padding: 20;
    fixed-num-lines: true;
}

* {
    background: #1e1e2e;
    foreground: #cdd6f4;
    border: 0;
    margin: 0;
    padding: 0;
}

window {
    border-radius: 10px;
    transparency: "real";
}

mainbox {
    orientation: vertical;
    spacing: 10px;
    children: [inputbar, listview];
}

inputbar {
    background: #181825;
    border-radius: 8px;
    padding: 10px 12px;
}

prompt {
    text-color: #cba6f7;
}

entry {
    placeholder-color: #a6adc8;
    expand: true;
    text-color: #cdd6f4;
}

listview {
    layout: vertical;              /* <— ВАЖНО! Только вертикальный список */
    dynamic: false;
    cycle: false;
    scrollbar: false;
    spacing: 6px;
    lines: 10;
    columns: 1;                    /* <— Без колонок */
}

element {
    background: transparent;
    text-color: #cdd6f4;
    padding: 6px 10px;
    border-radius: 6px;
}

element selected {
    background: #313244;
    text-color: #f5e0dc;
}

element alternate {
    background: transparent;
}

message {
    background: #181825;
    border-radius: 6px;
    padding: 6px;
}
')

# Если тема выбрана, запускаем apply-theme.sh с этой темой
if [ -n "$SELECTED_THEME" ]; then
    "$APPLY_SCRIPT" "$SELECTED_THEME"
fi