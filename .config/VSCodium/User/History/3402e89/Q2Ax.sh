#!/bin/bash

# Color codes
GREEN='\033[1;32M'
CYAN='\033[1;36M'
YELLOW='\033[1;33M'
NC='\033[0M' #No Color

THEME="$1"
THEME_DIR="$HOME/.config/colorschemes/$THEME"

if [ -z "$THEME" ]; then
    echo -e "${YELLOW}Usage: $0 <theme-name>${NC}"
    exit 1
fi 

if [ ! -d "$THEME_DIR" ]; then 
    echo -e "{$YELLOW}Theme '$THEME' does not exist at $THEME_DIR${NC}"
    exit 1
fi 

echo -e "${GREEN}Applying theme: $THEME{nc}\n"

# Hypr config
echo -e "${CYAN}-> Updating Hyprland configuration...${NC}"
cp "$THEME_DIR/hypr/colors.conf" "$HOME/.config/hypr/colors/colors.conf" > /dev/null 2>&1
echo ""

# Waybar config
echo -e "${CYAN}-> Applying Waybar CSS...${NC}"
cp "$THEME_DIR/waybar/colors.css" "$HOME/.config/waybar/colors/colors.css" > /dev/null 2>&1
echo -e "${CYAN}-> Restarting Waybar...${NC}"
pkill waybar > /dev/null 2>&1 && ~/.config/waybar/scripts/launch.sh > /dev/null 2>&1 disown
echo ""

# Wallpaper
echo -e "${CYAN}-> Setting wallpaper...${NC}"
swww img "$THEME_DIR/wallpaper.jpg" --transition-type center --transition-fps 60 --transition-step 255 > /dev/null 2>&1
echo ""

# GTK Theme
#if [ -f "$THEME_DIR/gtk-theme" ]; then
#    GTK_THEME_NAME=$(cat "$THEME_DIR/gtk-theme")
#    echo -e "${CYAN}-> Setting GTK theme to '$GTK_THEME_NAME'…${NC}"
#    gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME_NAME" > /dev/null 2>&1
#else
#    echo -e "${YELLOW}-> GTK theme file not found. Skipping.${NC}"
#fi
#echo ""

#GTK4_SRC="$THEME_DIR/gtk-4.0"
#GTK4_DST="$HOME/.config/gtk-4.0"

#if [[ -d "$GTK4_SRC" ]]; then
#    echo -e "${CYAN}-> Linking GTK4 theme files…${NC}"
#    mkdir -p "$GTK4_DST"
#    ln -sf "$GTK4_SRC/gtk.css" "$GTK4_DST/gtk.css"
#    ln -sf "$GTK4_SRC/gtk-dark.css" "$GTK4_DST/gtk-dark.css"
#    ln -sfn "$GTK4_SRC/assets" "$GTK4_DST/assets"
#else
#    echo -e "${YELLOW}-> No GTK4 theme files found in $GTK4_SRC. Skipping.${NC}"
#fi
#echo ""

# Reload Hyprland config
echo -e "${CYAN}-> Reloading Hyprland configuration…${NC}"
hyprctl reload > /dev/null 2>&1
echo ""

# Terminal theme
echo -e "${CYAN}-> Applying terminal theme…${NC}"
case "$THEME" in
    catppuccin |everforest-dark | rose-pine | kanagawa | tokyo-night | nightfox )
      cp "$THEME_DIR/kitty/colors.conf" "$HOME/.config/kitty/colors/colors.conf" > /dev/null 2>&1
      ;;
    *)
      echo -e "${YELLOW}-> No terminal theme defined for $THEME. Skipping.${NC}"
      ;;
esac
kill -SIGUSR1 "$(pgrep kitty)" > /dev/null 2>&1
echo ""

# SwayNC theme
#echo -e "${CYAN}-> Applying SwayNC theme…${NC}"
#cp "$THEME_DIR/swaync/style.css" "$HOME/.config/swaync/style.css" > /dev/null 2>&1
#pkill swaync > /dev/null 2>&1 && swaync > /dev/null 2>&1 & disown
#echo ""
