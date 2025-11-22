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
    font: "Operator Mono 12";
    background: #1111;
    foreground: #cdd6f4;
    selected: #89b4fa;
    border: 0;
    border-radius: 16px;
    padding: 0;
}

window {
    width: 480px;
    border: 0;
    border-radius: 16px;
    background-color: @background;
}

mainbox {
    children: [inputbar, listview];
    spacing: 14px;
    padding: 18px 20px;
}

inputbar {
    background-color: #313244;
    text-color: @foreground;
    border-radius: 12px;
    padding: 10px 14px;
    spacing: 8px;
}

prompt {
    enabled: false;
}

entry {
    placeholder: " Search themes...";
    padding: 0px 8px ;
    background-color: transparent;
    text-color: @foreground;
}

listview {
    spacing: 10px;
    lines: 8;
    columns: 1;
    fixed-height: false;
    scrollbar: false;
}

element {
    padding: 4px 14px 18px 14px;
    border-radius: 12px;
    background-color: transparent;
    text-color: #bac2de;
}

element selected {
    background-color: #45475a;
    border-radius: 15px;
    text-color: #89b4fa;
}

element-icon {
    size: 0;
    margin: 0;
}

element-text {
    vertical-align: 0.5;
    horizontal-align: 0.0;
    padding: 0 0 1px 0;
}

textbox {
    background-color: transparent;
    text-color: @foreground;
}
')

if [ -n "$SELECTED_THEME" ]; then
    "$APPLY_SCRIPT" "$SELECTED_THEME"
fi