#!/usr/bin/env sh

#Stores Symlinks for Firefox

#!/bin/bash

# Check if the user provided a search term

# Store the search term
search_term="default-release"
search_two="chrome"

# Define the specific folder to search in
firefox_config_path="/home/$(whoami)/.mozilla/firefox"
home_dir="/home/$(whoami)"

# Search for directories containing the search term in the specific folder
found_dirs=$(find "$firefox_config_path" -type d -name "*$search_term*")

# Check if any directories were found
if [ -z "$found_dirs" ]; then
    echo "No directories found in '$specific_folder' containing the term '$search_term'."
else
    echo "Directories found in '$specific_folder' containing the term '$search_term':"
    rm -r "$found_dirs/chrome"
    mkdir "$found_dirs/chrome"

    #Change wallpaper dir
    LINE_NUMBER=14
    NEW_LINE_CONTENT="        background: #f9a no-repeat url($found_dirs/chrome/img/firefox_wp.jpg) center ;"
    sed -i "${LINE_NUMBER}s|.*|${NEW_LINE_CONTENT}|" "$home_dir/.dotfiles/firefox/userContent.css"


    #Symlink
    ln -s "$home_dir/.dotfiles/firefox/userChrome.css" "$found_dirs/chrome/userChrome.css"
    ln -s "$home_dir/.dotfiles/firefox/userContent.css" "$found_dirs/chrome/userContent.css"
    mkdir "$found_dirs/chrome/img"
    cp "$home_dir/.dotfiles/firefox/img/firefox_wp.jpg" "$found_dirs/chrome/img/firefox_wp.jpg"
fi



#Emacs
rm -r "$home_dir/.config/doom"; mkdir "$home_dir/.config/doom"
for file in "$home_dir/.dotfiles/emacs/"*; do
  if [[ -e "$file" ]]; then
    ln -s "$file" "$home_dir/.config/doom/$(basename "$file")"
  fi
done

## OLD EMACS SECTION, CAN DELETE WHEN I KNOW THE NEW ONE WORKS
##for file in config.el custom.el init.el packages.el; do
##  ln -s "$home_dir/.dotfiles/emacs/$file" "$home_dir/.config/doom/$file"
##done

#Fish
rm -r "$home_dir/.config/fish"; mkdir "$home_dir/.config/fish"

#ln -s "$home_dir/.dotfiles/fish/completions" "$home_dir/.config/fish/completions"
#ln -s "$home_dir/.dotfiles/fish/conf.d" "$home_dir/.config/fish/conf.d"
ln -s "$home_dir/.dotfiles/fish/config.fish" "$home_dir/.config/fish/config.fish"
ln -s "$home_dir/.dotfiles/fish/fish_variables" "$home_dir/.config/fish/fish_variables"
#ln -s "$home_dir/.dotfiles/fish/functions" "$home_dir/.config/fish/functions"


#Starship
rm "$home_dir/.config/starship.toml"
ln -s "$home_dir/.dotfiles/starship/starship.toml" "$home_dir/.config/starship.toml"

#Hyprland
rm -r "$home_dir/.config/hypr"; mkdir "$home_dir/.config/hypr"
for file in env_var.conf env_var_nvidia.conf hyprland.conf media-binds.conf rog-g15-strix-2021-binds.conf xdg-portal-hyprland; do
    ln -s "$home_dir/.dotfiles/hyprland/$file" "$home_dir/.config/hypr/$file"
done

#Waybar
rm -r "$home_dir/.config/waybar"; mkdir "$home_dir/.config/waybar"
ln -s "$home_dir/.dotfiles/waybar/conf/config.jsonc" "$home_dir/.config/waybar/config.jsonc"
ln -s "$home_dir/.dotfiles/waybar/style/style/style.css" "$home_dir/.config/waybar/style.css"

#Kitty
rm -r "$home_dir/.config/kitty"; mkdir "$home_dir/.config/kitty"
for file in kitty.conf kitty.conf.bak mocha.conf current-theme.conf; do
   ln -s "$home_dir/.dotfiles/kitty/$file" "$home_dir/.config/kitty/$file"
done

#wlogout
rm -r "$home_dir/.config/wlogout"; mkdir "$home_dir/.config/wlogout"
ln -s "$home_dir/.dotfiles/wlogout/layout" "$home_dir/.config/wlogout/layout"

#Zathura
rm -r "$home_dir/.config/zathura"; mkdir "$home_dir/.config/zathura"
ln -s "$home_dir/.dotfiles/zathura/zathurarc" "$home_dir/.config/zathura/zathurarc"

#Mako
rm -r "$home_dir/.config/mako"; mkdir "$home_dir/.config/mako"
for file in config icons; do
   ln -s "$home_dir/.dotfiles/mako/$file" "$home_dir/.config/mako/$file"
done

#Swaylock
rm -r "$home_dir/.config/swaylock"; mkdir "$home_dir/.config/swaylock"
ln -s "$home_dir/.dotfiles/swaylock/config" "$home_dir/.config/swaylock/config"

#Gtk-3.0
rm -r "$home_dir/.config/gtk-3.0"; mkdir "$home_dir/.config/gtk-3.0"
for file in bookmarks settings.ini; do
   ln -s "$home_dir/.dotfiles/gtk-3.0/$file" "$home_dir/.config/gtk-3.0/$file"
done

rm -r "$home_dir/.themes"; mkdir "$home_dir/.themes"
rm -r "$home_dir/.icons"; mkdir "$home_dir/.icons"



for file in "$home_dir/.dotfiles/extras/gtk-3.0_extras/themes/"*; do
  if [[ -e "$file" ]]; then
    ln -s "$file" "$home_dir/.themes/$(basename "$file")"
  fi
done

for file in "$home_dir/.dotfiles/extras/gtk-3.0_extras/icons/"*; do
  if [[ -e "$file" ]]; then
    ln -s "$file" "$home_dir/.icons/$(basename "$file")"
  fi
done

#yazi
rm -r "$home_dir/.config/yazi"; mkdir "$home_dir/.config/yazi"
for file in keymap.toml theme.toml yazi.toml; do
   ln -s "$home_dir/.dotfiles/yazi/$file" "$home_dir/.config/yazi/$file"
done

#fonts
rm -r "$home_dir/.config/fontconfig"; mkdir "$home_dir/.config/fontconfig"
ln -s "$home_dir/.dotfiles/fontconfig/fonts.conf" "$home_dir/.config/fontconfig/fonts.conf"

#Enable firefox css customization (Apparently this is not possible, prefs.js updates everytime firefox starts)
#NEW_LINE_CONTENT="user_pref('"toolkit.legacyUserProfileCustomizations.stylesheets"', true);"
#NEW_LINE_CONTENT=""
#LINE_NUMBER=$(grep -n "toolkit.legacyUserProfile" "$found_dirs/prefs.js" | cut -d: -f1)
#sed -i "${LINE_NUMBER}s/.*/${NEW_LINE_CONTENT}/" "$found_dirs/prefs.js"
