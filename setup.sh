# !/bin/bash
#
#
#
#
#
#██████████         █████            █████                                     ████                           █████
#░░███░░░░███       ░░███            ░░███                                     ░░███                          ░░███
# ░███   ░░███       ░███             ░███████   █████ ████ ████████  ████████  ░███   ██████   ████████    ███████
# ░███    ░███       ░███  ██████████ ░███░░███ ░░███ ░███ ░░███░░███░░███░░███ ░███  ░░░░░███ ░░███░░███  ███░░███
# ░███    ░███       ░███ ░░░░░░░░░░  ░███ ░███  ░███ ░███  ░███ ░███ ░███ ░░░  ░███   ███████  ░███ ░███ ░███ ░███
# ░███    ███  ███   ░███             ░███ ░███  ░███ ░███  ░███ ░███ ░███      ░███  ███░░███  ░███ ░███ ░███ ░███
# ██████████  ░░████████              ████ █████ ░░███████  ░███████  █████     █████░░████████ ████ █████░░████████
#░░░░░░░░░░    ░░░░░░░░              ░░░░ ░░░░░   ░░░░░███  ░███░░░  ░░░░░     ░░░░░  ░░░░░░░░ ░░░░ ░░░░░  ░░░░░░░░
#                                                 ███ ░███  ░███
#                                                ░░██████   █████
#                                                 ░░░░░░   ░░░░░
#
#
# DJ-hyprland by djstillxyz - https://github.com/djstillxyz
# License - GPL-3.0
#
# 1. Core Packages:
#   Terminal:            kitty
#   Shell:               fish
#   File Search:         bemenu
#   File Manager:        yazi
#   Screen Locker:       swaylock
#   Notification Daemon: mako
#   Menu Bar:            waybar
#   Sound Server:        pulseaudio
#   Shell Prompt:        starship
#   Logout Menu:         wlogout
#   Wallpaper Manager:   swww
#   AUR helpter:         paru
#
# 2. Utilities:
#   Browser:             firefox
#   Editor:              emacs
#   Image Viewer:        TBD
#   Video Viewer:        TBD
#   PDF Viewer:          emacs
#   Music Player:        slizbop
#   Screenshot Software: TBD
#
#----------------------------------------------------------------------------------

prep_stage=(
    qt5-wayland
    qt5ct
    qt6-wayland
    qt6ct
    qt5-svg
    qt5-quickcontrols2
    qt5-graphicaleffects
    gtk3
    jq
    wl-clipboard
    cliphist
    python-requests
    pacman-contrib
)

#software for nvidia GPU only
nvidia_stage=(
    linux-headers
    nvidia-dkms
    nvidia-settings
    libva
    libva-nvidia-driver-git
)

#the main packages
install_stage=(
    kitty
    mako
    waybar
    swww
    swaylock-effects
    bemenu-wayland
    wlogout
    xdg-desktop-portal-hyprland
    slurp
    thunar
    btop
    firefox
    pavucontrol
    brightnessctl
    gvfs
    thunar-archive-plugin
    starship
    ttf-jetbrains-mono-nerd
    fish
    discord
    yazi
    texlab
)

for str in ${myArray[@]}; do
  echo $str
done

# set some colors
CNT="[\e[1;36mNOTE\e[0m]"
COK="[\e[1;32mOK\e[0m]"
CER="[\e[1;31mERROR\e[0m]"
CAT="[\e[1;37mATTENTION\e[0m]"
CWR="[\e[1;35mWARNING\e[0m]"
CAC="[\e[1;33mACTION\e[0m]"
INSTLOG="install.log"

######
# functions go here

# function that would show a progress bar to the user
show_progress() {
    while ps | grep $1 &> /dev/null;
    do
        echo -n "."
        sleep 2
    done
    echo -en "Done!\n"
    sleep 2
}

# function that will test for a package and if not found it will attempt to install it
install_software() {
    # First lets see if the package is there
    if paru -Q $1 &>> /dev/null ; then
        echo -e "$COK - $1 is already installed."
    else
        # no package found so installing
        echo -en "$CNT - Now installing $1 ."
        paru -S --noconfirm $1 &>> $INSTLOG &
        show_progress $!
        # test to make sure package installed
        if paru -Q $1 &>> /dev/null ; then
            echo -e "\e[1A\e[K$COK - $1 was installed."
        else
            # if this is hit then a package is missing, exit to review log
            echo -e "\e[1A\e[K$CER - $1 install had failed, please check the install.log"
            exit
        fi
    fi
}

# clear the screen
clear

 find the Nvidia GPU
if lspci -k | grep -A 2 -E "(VGA|3D)" | grep -iq nvidia; then
    ISNVIDIA=true
else
    ISNVIDIA=false
fi

#### Check for package manager ####
if [ ! -f /sbin/paru ]; then
    echo -en "$CNT - Configuering paru."
    cd ~/repos/public
    git clone https://aur.archlinux.org/paru.git &>> $INSTLOG
    cd paru
    makepkg -si --noconfirm &>> ../$INSTLOG &
    show_progress $!
    if [ -f /sbin/paru ]; then
        echo -e "\e[1A\e[K$COK - paru configured"
        cd ..

        # update the paru database
        echo -en "$CNT - Updating paru."
        paru -Suy --noconfirm &>> $INSTLOG &
        show_progress $!
        echo -e "\e[1A\e[K$COK - paru updated."
    else
        # if this is hit then a package is missing, exit to review log
        echo -e "\e[1A\e[K$CER - paru install failed, please check the install.log"
        exit
    fi
fi



### Install all of the above pacakges ####
read -rep $'[\e[1;33mACTION\e[0m] - Would you like to install the packages? (y,n) ' INST
if [[ $INST == "Y" || $INST == "y" ]]; then

    # Prep Stage - Bunch of needed items
    echo -e "$CNT - Prep Stage - Installing needed components, this may take a while..."
    for SOFTWR in ${prep_stage[@]}; do
        install_software $SOFTWR
    done

    # Setup Nvidia if it was found
    if [[ "$ISNVIDIA" == true ]]; then
        echo -e "$CNT - Nvidia GPU support setup stage, this may take a while..."
        for SOFTWR in ${nvidia_stage[@]}; do
            install_software $SOFTWR
        done

        # update config
        sudo sed -i 's/MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf
        sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img
        echo -e "options nvidia-drm modeset=1" | sudo tee -a /etc/modprobe.d/nvidia.conf &>> $INSTLOG
    fi

    # Install the correct hyprland version
    echo -e "$CNT - Installing Hyprland, this may take a while..."
    install_software hyprland

    # Stage 1 - main components
    echo -e "$CNT - Installing main components, this may take a while..."
    for SOFTWR in ${install_stage[@]}; do
        install_software $SOFTWR
    done

    # DONT THINK I NEED THIS
    # Enable the sddm login manager service
    echo -e "$CNT - Enabling the SDDM Service..."
    sudo systemctl enable sddm &>> $INSTLOG
    sleep 2

    # Clean out other portals
    echo -e "$CNT - Cleaning out conflicting xdg portals..."
    paru -R --noconfirm xdg-desktop-portal-gnome xdg-desktop-portal-gtk &>> $INSTLOG
fi

### Copy Config Files ###
read -rep $'[\e[1;33mACTION\e[0m] - Would you like to copy config files? (y,n) ' CFG
if [[ $CFG == "Y" || $CFG == "y" ]]; then
    echo -e "$CNT - Copying config files..."

    # copy the HyprV directory
    #cp -R HyprV ~/.config/

    #set the measuring unit
    #echo -e "$CNT - Attempring to set mesuring unit..."
    #if locale -a | grep -q ^en_US; then
    #    echo -e "$COK - Setting mesuring system to imperial..."
    #    ln -sf ~/.config/HyprV/waybar/conf/mesu-imp.jsonc ~/.config/HyprV/waybar/conf/mesu.jsonc
    #    sed -i 's/SET_MESU=""/SET_MESU="I"/' ~/.config/HyprV/hyprv.conf
    #else
    #    echo -e "$COK - Setting mesuring system to metric..."
    #    sed -i 's/SET_MESU=""/SET_MESU="M"/' ~/.config/HyprV/hyprv.conf
    #    ln -sf ~/.config/HyprV/waybar/conf/mesu-met.jsonc ~/.config/HyprV/waybar/conf/mesu.jsonc
    #fi

    # Setup each appliaction
    # check for existing config folders and backup
    #for DIR in hypr kitty mako swaylock waybar wlogout wofi
    #do
    #    DIRPATH=~/.config/$DIR
    #    if [ -d "$DIRPATH" ]; then
    #        echo -e "$CAT - Config for $DIR located, backing up."
    #        mv $DIRPATH $DIRPATH-back &>> $INSTLOG
    #        echo -e "$COK - Backed up $DIR to $DIRPATH-back."
    #    fi
    #
    #    # make new empty folders
    #    mkdir -p $DIRPATH &>> $INSTLOG
    #done

    # link up the config files
    echo -e "$CNT - Setting up the new config..."
    chmod +x ~/repos/private/DJ-hyprland/symlink.sh && sh ~/repos/private/DJ-hyprland/symlink.sh && echo "dotfiles linked!"

    # add the Nvidia env file to the config (if needed)
    if [[ "$ISNVIDIA" == true ]]; then
        echo -e "\nsource = ~/.config/hypr/env_var_nvidia.conf" >> ~/.config/hypr/hyprland.conf
    fi

    # DONT THINK I NEED THIS
    # Copy the SDDM theme
    echo -e "$CNT - Setting up the login screen."
    sudo cp -R Extras/sdt /usr/share/sddm/themes/
    sudo chown -R $USER:$USER /usr/share/sddm/themes/sdt
    sudo mkdir /etc/sddm.conf.d
    echo -e "[Theme]\nCurrent=sdt" | sudo tee -a /etc/sddm.conf.d/10-theme.conf &>> $INSTLOG
    WLDIR=/usr/share/wayland-sessions
    if [ -d "$WLDIR" ]; then
        echo -e "$COK - $WLDIR found"
    else
        echo -e "$CWR - $WLDIR NOT found, creating..."
        sudo mkdir $WLDIR
    fi

    # stage the .desktop file
    sudo cp Extras/hyprland.desktop /usr/share/wayland-sessions/

    # setup the first look and feel as dark
    xfconf-query -c xsettings -p /Net/ThemeName -s "Everforest-Light"
    xfconf-query -c xsettings -p /Net/IconThemeName -s "Zafiro-Nord-Dark-Grey"
    gsettings set org.gnome.desktop.interface gtk-theme "Everforest-Light"
    gsettings set org.gnome.desktop.interface icon-theme "Zafiro-Nord-Dark-Grey"
    cp -f ~/repos/private/DJ-hyprland/dotfiles/extras/wallpapers/2.jpg /usr/share/sddm/themes/sdt/wallpaper.jpg
fi

### Install software for Asus ROG laptops ###
read -rep $'[\e[1;33mACTION\e[0m] - For ASUS ROG Laptops - Would you like to install Asus ROG software support? (y,n) ' ROG
if [[ $ROG == "Y" || $ROG == "y" ]]; then
    echo -e "$CNT - Adding Keys..."
    sudo pacman-key --recv-keys 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35 &>> $INSTLOG
    sudo pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35 &>> $INSTLOG
    sudo pacman-key --lsign-key 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35 &>> $INSTLOG
    sudo pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35 &>> $INSTLOG

    LOC="/etc/pacman.conf"
    echo -e "$CNT - Updating $LOC with g14 repo."
    echo -e "\n[g14]\nServer = https://arch.asus-linux.org" | sudo tee -a $LOC &>> $INSTLOG
    echo -e "$CNT - Update the system..."
    sudo pacman -Suy --noconfirm &>> $INSTLOG

    echo -e "$CNT - Installing ROG pacakges..."
    install_software asusctl
    install_software supergfxctl
    install_software rog-control-center

    echo -e "$CNT - Activating ROG services..."
    sudo systemctl enable --now power-profiles-daemon.service &>> $INSTLOG
    sleep 2
    sudo systemctl enable --now supergfxd &>> $INSTLOG
    sleep 2

    # add the ROG keybinding file to the config
    echo -e "\nsource = ~/.config/hypr/rog-g15-strix-2021-binds.conf" >> ~/.config/hypr/hyprland.conf
fi

#--------------------------------------------------------------------------------------------------#

# Install miniconda + configure in PATH
mkdir -p ~/repos/public/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/repos/public/miniconda3/miniconda.sh
bash ~/repos/public/miniconda3/miniconda.sh -b -u -p ~/repos/public/miniconda3
rm ~/repos/public/miniconda3/miniconda.sh

sh ~/repos/public/miniconda3/bin/conda init --all

sh source ~/repos/private/DJ-hyprland/dotfiles/fish/config.fish

# Install emacs

cd ~/repos/public

# emacs core dependencies
sudo pacman -S cmake gd libotf m17n-lib tree-sitter libgccjit

# other dependencies, can maybe be lumped in with above
sudo pacman -S libgccjit libgccjit-devel gtk3 gtk3-devel gtk4 gtk4-devel libtree-sitter libtree-sitter-devel \
     jansson-devel libvterm-devel webkit2gtk5.0-devel gnutls-devel

# dependencies for pdf-tools
sudo pacman -S poppler poppler-glib

git clone --single-branch --branch=emacs-29 git://git.sv.gnu.org/emacs.git emacs-29

cd emacs-29/

sh autogen.sh


# Might need to do this step manually, not sure if this works properly,
# this step is vital to ensuring emacs has transparency and compiles correctly
./configure --without-compress-install \
            --with-pgtk \
            --without-libotf \
            --with-x-toolkit=no \
            --with-cairo \
            --with-native-compilation=aot \
            --with-tree-sitter \
            --with-json \
            --with-mailutils \
            --with-rsvg \
            CFLAGS="-O2 -mtune=native -march=native -fomit-frame-pointer" \
            --prefix=/usr/local

make -j16

make check

sudo make install

# Setup Doom emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
sudo rm -r ~/.emacs.d
doom sync

# Fix paru location
#cd ~/repos/DJShypr
#mv paru ~

# Uninstall dolphin and related packages
sudo pacman -Rns dolphin


### Script is done ###
echo -e "$CNT - Script had completed!"
if [[ "$ISNVIDIA" == true ]]; then
    echo -e "$CAT - Since we attempted to setup an Nvidia GPU the script will now end and you should reboot.
    Please type 'reboot' at the prompt and hit Enter when ready."
    exit
fi

read -rep $'[\e[1;33mACTION\e[0m] - Would you like to start Hyprland now? (y,n) ' HYP
if [[ $HYP == "Y" || $HYP == "y" ]]; then
    exec sudo systemctl start sddm &>> $INSTLOG
else
    exit
fi


## POTENTIALLY ADD THESE THINGS

## Install latest Mesa Driver (AMD Only)
##git clone https://github.com/Frogging-Family/mesa-git.git ~/mesa-git
##cd ~/mesa-git
##yes | makepkg -si

## Install Vulkan driver (AMD Only)
##sudo pacman -S vulkan-radeon lib32-vulkan-radeon
