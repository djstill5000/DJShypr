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
    ln -s "$home_dir/.dotfiles/firefox/userChrome.css" "$found_dirs/chrome/userChrome.css"
    ln -s "$home_dir/.dotfiles/firefox/userContent.css" "$found_dirs/chrome/userContent.css"
    mkdir "$found_dirs/chrome/img"
    cp "$home_dir/.dotfiles/firefox/img/firefox_wp.jpg" "$found_dirs/chrome/img/firefox_wp.jpg"
fi



#Emacs
rm -r "$home_dir/.config/doom"; mkdir "$home_dir/.config/doom"
for file in config.el custom.el init.el packages.el; do
  ln -s "$home_dir/.dotfiles/emacs/$file" "$home_dir/.config/doom/$file"
done

#Fish
#rm -r "$home_dir/.config/fish"; mkdir "$home_dir/.config/fish"

#ln -s "$home_dir/.dotfiles/fish/completions" "$home_dir/.config/fish/completions"
#ln -s "$home_dir/.dotfiles/fish/conf.d" "$home_dir/.config/fish/conf.d"
#ln -s "$home_dir/.dotfiles/fish/config.fish" "$home_dir/.config/fish/config.fish"
#ln -s "$home_dir/.dotfiles/fish/fish_variables" "$home_dir/.config/fish/fish_variables"
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
ln -s "$home_dir/.dotfiles/waybar/conf/v4-config.jsonc" "$home_dir/.config/waybar/config.jsonc"
ln -s "$home_dir/.dotfiles/waybar/style/style/v4-style.css" "$home_dir/.config/waybar/style.css"

#Kitty
rm -r "$home_dir/.config/kitty"; mkdir "$home_dir/.config/kitty"
for file in kitty.conf kitty.conf.bak mocha.conf; do
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
for file in conf icons; do
   ln -s "$home_dir/.dotfiles/mako/$file" "$home_dir/.config/mako/$file"
done

#Swaylock
rm -r "$home_dir/.config/swaylock"; mkdir "$home_dir/.config/swaylock"
ln -s "$home_dir/.dotfiles/swaylock/config" "$home_dir/.config/swaylock/config"
