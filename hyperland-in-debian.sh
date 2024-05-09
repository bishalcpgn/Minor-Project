git clone --recursive https://github.com/hyprwm/Hyprland -b v0.24.1
cd Hyprland
cd subprojects
git clone https://gitlab.freedesktop.org/emersion/libdisplay-info
git clone https://github.com/emersion/libliftoff
cd ..
meson build
ninja -C build
sudo ninja -C build install
