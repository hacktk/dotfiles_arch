#!/bin/bash

set -eux

# gnome-terminal
GNOME_TERMINAL_PROFILE=`gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}'`
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ font 'Ricty Regular 12'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ use-system-font false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ audible-bell false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ use-theme-colors false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ foreground-color '#d3d7cf'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ background-color '#2e3436'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ palette "['#2e3436', '#ef3f3f', '#4e9a06', '#c4a000', '#3465a4', '#75507b', '#06989a', '#d3d7cf', '#555753', '#ef2929', '#8ae234', '#fce94f', '#729fcf', '#ad7fa8', '#34e2e2', '#eeeeec']"
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ bold-is-bright true
gsettings set org.gnome.Terminal.Legacy.Settings confirm-close false
gsettings set org.gnome.Terminal.Legacy.Settings headerbar false

# desktop
xrandr --output HDMI-A-0 --mode 3840x2160
gsettings set org.gnome.desktop.interface scaling-factor 2
gsettings set org.gnome.desktop.background picture-uri 'none'
gsettings set org.gnome.desktop.background primary-color '#444444'
gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog "['<Control>3']"
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
gsettings set org.gnome.desktop.peripherals.keyboard delay 200
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
gsettings set org.gnome.desktop.peripherals.touchpad send-events 'enabled'

# power
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

# dock
# https://github.com/micheleg/dash-to-dock/blob/master/schemas/org.gnome.shell.extensions.dash-to-dock.gschema.xml
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-switch-workspace false
gsettings set org.gnome.shell.extensions.dash-to-dock show-windows-preview false
gsettings set org.gnome.shell.extensions.dash-to-dock show-favorites false

# nautilus
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'

# date & time
timedatectl set-ntp on
