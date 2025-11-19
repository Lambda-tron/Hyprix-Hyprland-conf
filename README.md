# Minimal Hyprland Theme & Configs

A clean, dark, **Hyprland** setup for Wayland users. With modern Linux tools like **Kitty**, **Rofi**, **Hyprlock**, and **Neovim** — all preconfigured.

This repository includes a full setup script that installs all required packages, sets up your shell, and copies all configs automatically.

---

## 🚀 What the Setup Script Does

Running `setup.sh` will automatically:

### **1️⃣ Install all required packages (Arch Linux)**
Including:
- Hyprland
- Hyprlock
- Waybar
- Kitty
- Rofi (Wayland)
- Neovim
- Intel drivers (mesa, vulkan-intel, intel-media-driver)
- xdg-desktop-portal-hyprland
- Various Wayland tools (wl-clipboard, grim, slurp, etc.)

### **2️⃣ Install IBM 3270 Nerd Font**
The script:
- Downloads 3270 Nerd Font
- Extracts it to `~/.local/share/fonts/NerdFonts`
- Updates font cache automatically

### **3️⃣ Set Zsh as the default shell**
The script:
- Installs Zsh
- Adds `/bin/zsh` to `/etc/shells` if needed
- Runs `chsh -s /bin/zsh` to make Zsh the login shell

### **4️⃣ Auto-start Hyprland on login**
The script updates `~/.zshrc` so that Hyprland starts automatically when logging into **TTY1**:

```bash
if [[ -z "$WAYLAND_DISPLAY" && -z "$DISPLAY" && "${XDG_VTNR:-0}" -eq 1 ]]; then
  exec Hyprland
fi
```

### **5️⃣ Copy all repo configs to `~/.config/`**
The script moves these directories:
- `hypr/`
- `kitty/`
- `nvim/`
- `rofi/`

to:
```
~/.config/
```

If any of them already exist, they are backed up automatically:
```
~/.config/hypr.bak-YYYYMMDD-HHMMSS
```

---

## 🔧 Manual Things You Still Need to Configure

⚠️ **You must set these yourself:**
- Monitor layout in `hyprland.conf`
- Kitty font size in `kitty.conf`
- Keyboard layout in `hyprland.conf`

Everything else works out of the box.

---

## 🖼️ Screenshots

| Desktop 1 | Desktop 2 |
|:----------:|:----------:|
| ![Desktop 1](previews/desktop1.png) | ![Desktop 2](previews/desktop2.png) |

| Rofi Menu | Hyprlock |
|:----------:|:----------:|
| ![Rofi](previews/rofi.png) | ![Hyprlock](previews/hyprlock.png) |

---

## 📦 Installation

Clone the repo:
```bash
git clone https://github.com/YOUR_USERNAME/Matrix-Minimal-Hyprland.git
cd Matrix-Minimal-Hyprland
```

Run the setup:
```bash
chmod +x setup.sh
./setup.sh
```

Reboot or log into TTY1 again and Hyprland will start automatically.

---

## 🎵 Optional: Terminal Spotify Setup

```bash
yay -S spotifyd spotify-player
```
Then run:
```bash
spotify_player
```

---

## 🧮 Neovim with Lazy.nvim
A preconfigured Neovim setup is included in the repo.
Just launch:
```bash
nvim
```
Lazy.nvim will install everything automatically.

---

## ✅ Done!
After running the script, you will have:
- Full Hyprland environment
- Preconfigured terminal + rofi + neovim
- Auto-start setup
- Nerd Fonts installed
- Clean, minimal theme

Enjoy your new Hyprland setup! 💚
