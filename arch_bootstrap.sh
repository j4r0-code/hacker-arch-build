
#!/bin/bash

# Update system
sudo pacman -Syu

# Install Xorg and i3
sudo pacman -S xorg-server xorg-xinit i3-wm i3status i3blocks dmenu

# Install Compton for compositor
sudo pacman -S compton

# Install Neovim and VSCode
sudo pacman -S neovim code

# Install Python and Go
sudo pacman -S python go

# Install Tmux
sudo pacman -S tmux

# Install Nerd Fonts
sudo pacman -S nerd-fonts-complete

# Install Alacritty terminal
sudo pacman -S alacritty

# Install Oh My Zsh
sh -c "\$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install PowerShell
sudo pacman -S powershell

# Install Rofi
sudo pacman -S rofi

# Install VMware Tools
sudo pacman -S open-vm-tools
sudo systemctl enable vmtoolsd.service
sudo systemctl start vmtoolsd.service

# Add BlackArch repository
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh

# Clean up
sudo pacman -Sc

echo "Installation complete. Please reboot your system."
