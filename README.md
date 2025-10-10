# 💚 ArchTheme — Matrix Minimal Hyprland Setup

A **Wayland + Hyprland** setup with a **green Matrix-style minimal aesthetic**.  
Built for Arch Linux users who love a clean, futuristic, and terminal-centric environment.  
It features **Neovim (Lazy + Everblush + nvim-tree)**, **Kitty**, **Hyprlock**, **Rofi**, and **Neofetch** — all working together for a fast and visually consistent workflow.

---
## 🖼️ Preview

| Desktop 1 | Desktop 2 | Neovim |
|:---------:|:---------:|:------:|
| ![Desktop 1](previews/desktop-1.png) | ![Desktop 2](previews/desktop-2.png) | ![Neovim](previews/neovim.png) |

| Hyprlock | Rofi |
|:--------:|:----:|
| ![Hyprlock](previews/hyprlock.png) | ![Rofi](previews/rofi.png) |

# 🧩 System Overview

- **Display Server:** Wayland  
- **Window Manager:** Hyprland  
- **Lock Screen:** Hyprlock  
- **Terminal:** Kitty  
- **Editor:** Neovim (Lazy.nvim + Everblush + nvim-tree)  
- **App Launcher:** Rofi (Wayland version)  
- **Screenshot Tool:** Hyprshot  
- **System Info:** Neofetch (AUR version)  
- **Theme:** 🟢 Green Matrix Minimal — glowing green text on dark backgrounds

---

# ⚙️ 1. Install Wayland + Hyprland + Hyprlock

Run the following on a fresh Arch Linux system:

```bash
sudo pacman -Syu --needed   hyprland waybar rofi   hyprlock hyprshot   ttf-jetbrains-mono-nerd   wl-clipboard   xdg-desktop-portal-hyprland   grim slurp   git curl
```

> 💡 `xdg-desktop-portal-hyprland` ensures screen sharing and screenshots work correctly.

---

# 💻 2. Install Neovim (Lazy.nvim + Everblush + nvim-tree)

```bash
sudo pacman -S --needed neovim git curl nodejs npm python-pynvim ripgrep fd clang
```

### Install Lazy.nvim (Plugin Manager)
```bash
git clone https://github.com/folke/lazy.nvim ~/.local/share/nvim/lazy/lazy.nvim
```

### Optional: Everblush Theme
```bash
git clone https://github.com/Everblush/nvim ~/.local/share/nvim/lazy/everblush.nvim
```

### Start Neovim
```bash
nvim
```
> Your config files should define plugins and settings in `~/.config/nvim/lua/plugins`.

---

# 🐱 3. Install Kitty Terminal

```bash
sudo pacman -S kitty
```

Kitty provides **GPU acceleration**, **fast rendering**, and **transparent green aesthetics** — perfect for a Matrix-style setup.

---

# 🔒 4. Hyprlock Setup

Hyprlock provides a stylish and minimal Wayland lock screen.  
You can later edit the config to customize blur, background, and clock color.

📁 **Screenshot Placeholder:**  
`previews/hyprlock.png`

Launch manually with:
```bash
hyprlock
```

---

# 🎨 5. Rofi (Application Launcher)

Rofi is your clean and minimal application launcher for Wayland.

```bash
sudo pacman -S rofi
```

> 🎭 **Configuration coming soon...**  
> (A themed Rofi configuration file matching the Matrix green aesthetic will be added here.)

---

# 📸 6. Screenshots with Hyprshot

Take clean Wayland screenshots with:
```bash
hyprshot -m region
```

---

# 🧾 7. Neofetch (AUR Version)

Install the **AUR version** for the latest updates and ASCII support:
```bash
yay -S neofetch
```

If `yay` is not installed yet:
```bash
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
```

---

# 🚀 Final Step — Apply All Configurations

After cloning this repository:

```bash
git clone https://github.com/YourUsername/ArchTheme.git
cd ArchTheme
cp -r * ~/.config/
```

Your setup will now include:
- 🪟 Hyprland (Matrix-style layout)  
- 🐱 Kitty (green transparent terminal)  
- 💻 Neovim (Lazy + Everblush + nvim-tree)  
- 🔒 Hyprlock  
- 🎨 Rofi (theme coming soon)  
- 📸 Hyprshot  
- 🧾 Neofetch  

---

✅ **Enjoy your fully themed Matrix-style Arch Linux desktop!**  
Minimal, glowing, and perfectly balanced for performance and style.
