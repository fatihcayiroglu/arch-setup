# 🚀 Arch Linux: Ultimate Engineering Setup

An intelligent, modular, and hardware-aware post-installation script for Arch Linux. Designed for developers and power users to instantly transform a fresh Arch install into a fully optimized, battle-ready workstation.

## ✨ Key Features

* **🧠 Smart Hardware Detection:** Automatically identifies and installs the correct graphics drivers (NVIDIA, AMD, Intel, or VirtualBox) and applies the correct CPU microcode patches.
* **🛡️ System Protection:** Pre-configured `ufw` firewall and `earlyoom` (RAM shield) to prevent system lockups under heavy loads.
* **⚡ Core Optimization:** Auto-sorts the fastest Pacman mirrors via `reflector`, optimizes swap usage, and enables SSD TRIM operations.
* **🔋 Laptop/Desktop Awareness:** Automatically detects battery presence and enables `tlp` for power management if installed on a laptop.
* **🧩 Modular Installation:** Interactively choose exactly what you need:
  * **Developer Pack:** VS Code, Node.js, Python, DBeaver.
  * **DevOps & Cloud:** Docker & Docker Compose infrastructure.
  * **AI Tools:** Local LLM environment with Ollama & PM2.
  * **God Mode:** Modern CLI tools (`eza`, `fzf`, `zoxide`) & Gaming (`gamemode`, `mangohud`).
  * **System Aesthetics:** `fastfetch`, `btop`, `timeshift` for backups.
* **🔑 GitHub Automation:** One-click automated SSH key generation and Git user configuration.

## 🚀 Quick Start

Run the following commands in your terminal to fetch and execute the setup assistant:

```bash
git clone [https://github.com/fatihcayiroglu/arch-setup.git](https://github.com/fatihcayiroglu/arch-setup.git)
cd arch-setup
chmod +x oto_kurulum.sh
./oto_kurulum.sh

## 💿 Download Arch-Lab Edition
The easiest way to get started! Download the pre-built, hardware-aware ISO image from our official release:

🚀 **[Download Arch-Lab Edition v1.0.0 ISO](https://github.com/fatihcayiroglu/arch-setup/releases/tag/v1.0.0)**
