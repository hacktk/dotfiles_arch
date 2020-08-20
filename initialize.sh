#!/bin/bash

set -eux

# pacman
curl "https://www.archlinux.org/mirrorlist/?country=JP&protocol=https&ip_version=4" > /etc/pacman.d/mirrorlist
sed -i -e 's/#Server/Server/g' /etc/pacman.d/mirrorlist
sed -i -e 's/#Color/Color/g' /etc/pacman.conf
pacman -Syy

# timezone
ln -sf /usr/share/zoneinfo/Japan /etc/localtime
hwclock --systohc --utc

# localization
sed -i -e 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
sed -i -e 's/#ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

# hostname
echo "m75q" > /etc/hostname
echo "127.0.0.1 localhost m75q m75q.localdomain" >> /etc/hosts

# grub
pacman -S --noconfirm grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch_grub --recheck
grub-mkconfig -o /boot/grub/grub.cfg

# xorg
pacman -S --noconfirm xorg-server xorg-xinit
startx

# graphic driver
pacman -S --noconfirm xf86-video-amdgpu mesa

# gnome
pacman -S --noconfirm gnome
systemctl enable gdm

# network
pacman -S --noconfirm networkmanager
systemctl enable NetworkManager

# main user
pacman -S --noconfirm sudo
useradd -m -g wheel hacktk
passwd hacktk
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel

# disable root
passwd -l root
