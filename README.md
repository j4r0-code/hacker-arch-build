# hacker-arch-build


1. **Create a New Virtual Machine**
    
    - Open VMware Workstation.
    - Select "Create a New Virtual Machine".
    - Choose "Custom (Advanced)" and click "Next".
    - Follow the wizard, selecting the downloaded Arch Linux ISO when prompted.
2. **Begin Installation**
    
    - Start the virtual machine.
    - Once the Arch Linux boot menu appears, select "Boot Arch Linux" and press Enter.
3. **Set the Keyboard Layout**
    
    - If you need a different keyboard layout, list available layouts with `ls /usr/share/kbd/keymaps/**/*.map.gz`.
    - Load your preferred layout (e.g., `loadkeys de-latin1` for German).
4. **Connect to the Internet**
    
    - Ensure your network is connected: `ping google.com`.
5. **Partition the Disk**
    
    - List disks: `lsblk`.
    - Partition the disk (e.g., `cfdisk /dev/sda`).
        - Create a new partition table (GPT is recommended).
        - Create partitions: EFI (300M), root (remaining space).
6. **Format Partitions**
    
    - Format EFI partition: `mkfs.fat -F32 /dev/sda1`.
    - Format root partition: `mkfs.ext4 /dev/sda2`.
7. **Mount Partitions**
    
    - Mount root: `mount /dev/sda2 /mnt`.
    - Create EFI directory: `mkdir -p /mnt/boot/EFI`.
    - Mount EFI: `mount /dev/sda1 /mnt/boot/EFI`.
8. **Install Base System**
    
    - Install base packages: `pacstrap /mnt base linux linux-firmware`.
9. **Generate Fstab**
    
    - Generate fstab file: `genfstab -U /mnt >> /mnt/etc/fstab`.
10. **Chroot into the System**
    
    - Change root into the new system: `arch-chroot /mnt`.
11. **Time Zone and Locale**
    
    - Set time zone (e.g., `ln -sf /usr/share/zoneinfo/Region/City /etc/localtime`).
    - Run `hwclock --systohc`.
    - Edit `/etc/locale.gen` and uncomment your locale.
    - Generate locale: `locale-gen`.
12. **Network Configuration**
    
    - Create hostname file: `echo yourhostname > /etc/hostname`.
    - Edit `/etc/hosts` accordingly.
13. **Set Root Password**
    
    - Set password: `passwd`.
14. **Install GRUB Bootloader**
    
    - Install GRUB: `pacman -S grub efibootmgr`.
    - Install GRUB to EFI: `grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=GRUB`.
    - Generate config: `grub-mkconfig -o /boot/grub/grub.cfg`.
15. **Create User**
    
    - Add user: `useradd -mG wheel hacker`.
    - Set password: `passwd hacker`.
    - Edit sudoers file: `EDITOR=nano visudo`.
16. **Exit and Reboot**
    
    - Exit chroot: `exit`.
    - Unmount partitions: `umount -R /mnt`.
    - Reboot: `reboot`.

#### Post-Installation (Bootstrap Script)

For the bootstrap script to install i3, i3blocks, Compton, Neovim, etc., please download the following script. It will automate the remaining setup, including installing the BlackArch repository, GUI, and development tools.
