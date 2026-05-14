#!/bin/bash

echo "🚀 Arch Linux: Ultimate Engineering Setup Assistant"
echo "--------------------------------------------------------"

echo "⚡ 1. Speed Optimization & Core Packages..."
sudo pacman -S --noconfirm reflector
sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo sed -i '/^#\[multilib\]/{s/^#//;n;s/^#//}' /etc/pacman.conf
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm base-devel git wget curl unrar unzip

echo "🪄 2. Integrating AUR Helper (yay)..."
if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git
    cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay
fi

echo "🧠 3. Universal Hardware Intelligence Activated..."
# Smart GPU Detection
if lspci | grep -qi "NVIDIA"; then
    sudo pacman -S --noconfirm --needed nvidia-utils lib32-nvidia-utils
elif lspci | grep -qi "AMD"; then
    sudo pacman -S --noconfirm --needed vulkan-radeon lib32-vulkan-radeon
elif lspci | grep -qi "Intel"; then
    sudo pacman -S --noconfirm --needed vulkan-intel lib32-vulkan-intel
elif lspci | grep -qi "VirtualBox"; then
    sudo pacman -S --noconfirm --needed vulkan-virtio lib32-vulkan-virtio
else
    sudo pacman -S --noconfirm --needed vulkan-swrast lib32-vulkan-swrast
fi

# CPU Microcode Patch
if grep -qi "intel" /proc/cpuinfo; then
    sudo pacman -S --noconfirm --needed intel-ucode
elif grep -qi "amd" /proc/cpuinfo; then
    sudo pacman -S --noconfirm --needed amd-ucode
fi

# SSD Protection (TRIM)
sudo systemctl enable --now fstrim.timer

# Laptop/Desktop Detection
if ls /sys/class/power_supply/ | grep -q "BAT"; then
    sudo pacman -S --noconfirm --needed tlp tlp-rdw
    sudo systemctl enable --now tlp
fi

echo "🛡️ 4. System Protection (Firewall & RAM Shield)..."
sudo pacman -S --noconfirm --needed ufw earlyoom
sudo systemctl enable --now ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw --force enable
sudo systemctl enable --now earlyoom

echo "🧩 5. Modular Installation..."
read -p "💻 [1] Developer Pack (VS Code, Node.js, Python, DBeaver) [y/N]: " dev
[[ "$dev" == "y" || "$dev" == "Y" ]] && sudo pacman -S --noconfirm nodejs npm gcc python python-pip dbeaver && yay -S --noconfirm visual-studio-code-bin

read -p "☁️  [2] Docker & DevOps Infrastructure [y/N]: " cloud
[[ "$cloud" == "y" || "$cloud" == "Y" ]] && sudo pacman -S --noconfirm docker docker-compose && sudo systemctl enable --now docker && sudo usermod -aG docker $USER

read -p "🤖 [3] AI Tools (Ollama & pm2) [y/N]: " ai
[[ "$ai" == "y" || "$ai" == "Y" ]] && sudo pacman -S --noconfirm ollama && sudo npm install -g pm2 && sudo systemctl enable --now ollama

read -p "🎮 [4] God Mode: Modern CLI & Gaming (eza, fzf, gamemode, mangohud) [y/N]: " godmode
[[ "$godmode" == "y" || "$godmode" == "Y" ]] && sudo pacman -S --noconfirm --needed eza bat fzf zoxide gamemode lib32-gamemode mangohud lib32-mangohud

read -p "🖥️ [5] System Aesthetics (Fastfetch, btop, Timeshift) [y/N]: " sistem
[[ "$sistem" == "y" || "$sistem" == "Y" ]] && sudo pacman -S --noconfirm timeshift btop fastfetch

echo "⚙️ 6. Performance Tuning..."
echo 'vm.swappiness=10' | sudo tee /etc/sysctl.d/99-swappiness.conf
sudo sysctl -p /etc/sysctl.d/99-swappiness.conf

echo "🔑 7. GitHub Automation..."
read -p "Generate SSH Key for GitHub automatically? [y/N]: " ssh_cevap
if [[ "$ssh_cevap" == "y" || "$ssh_cevap" == "Y" ]]; then
    read -p "GitHub Email: " git_email
    read -p "GitHub Username: " git_user
    git config --global user.email "$git_email"
    git config --global user.name "$git_user"
    
    ssh-keygen -t ed25519 -C "$git_email" -f ~/.ssh/id_ed25519 -N ""
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    
    echo "====================================================="
    echo "✅ SSH Key generated successfully!"
    echo "Copy the line below and paste it into GitHub -> Settings -> SSH Keys:"
    echo " "
    cat ~/.ssh/id_ed25519.pub
    echo "====================================================="
fi

echo "🎉 DONE! Your setup is complete."
