#!/bin/bash

set -eux

# nautilus
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

# launcher
gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog ['<Control>3']

# gnome-terminal
GNOME_TERMINAL_PROFILE=`gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}'`
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ font 'Ricty Regular 16'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ use-system-font false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ audible-bell false
gsettings set org.gnome.Terminal.Legacy.Settings confirm-close false

# desktop
gsettings set org.gnome.desktop.interface scaling-factor 2
gsettings set org.gnome.desktop.background picture-uri none
gsettings set org.gnome.desktop.background primary-color 666666

# dock
# https://github.com/micheleg/dash-to-dock/blob/master/schemas/org.gnome.shell.extensions.dash-to-dock.gschema.xml
gsettings set org.gnome.shell.extensions.dash-to-dock position LEFT
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-switch-workspace false
gsettings set org.gnome.shell.extensions.dash-to-dock show-windows-preview false
gsettings set org.gnome.shell.extensions.dash-to-dock show-favorites false

# key delay rate
xset r rate 200 30

# display resolusion
# xrandr --output HDMI-1 --mode 1920x1080
