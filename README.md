# ArchTheme

This is a **Wayland + Hyprland theme** designed to give a **retro Matrix-style aesthetic** to your Linux desktop.  
It combines minimalism with a tiled window manager layout, green-on-black vibes, and smooth animations — perfect for those who love a cyberpunk terminal look.

---

## Preview

| Screenshot 1 | Screenshot 2 | 
|:-------------:|:-------------:|
| ![Screenshot 1](previews/preview3.png) | ![Screenshot 2](previews/preview4.png)

# 🧩 System Setup (Wayland + Hyprland + Kitty)

This setup assumes a fresh Arch-based system.  
You’ll install **Wayland**, **Hyprland**, and **Kitty**, along with useful tools and configs for a complete modern environment.

---

## 🌿 Base System Installation

Install all essential packages for Wayland, Hyprland, and Kitty:

```bash
sudo pacman -S --needed \
  hyprland waybar rofi kitty \
  ttf-jetbrains-mono-nerd \
  git curl
```
## 🎵 Spotify CLI Setup

1. **Install the Spotify daemon (`spotifyd`)** — runs Spotify in the background:
   ```bash
   sudo pacman -S spotifyd
   ```

2. **Install the Spotify terminal client (`spotify-player`)**:
   ```bash
   sudo pacman -S spotify-player
   ```

   > The `spotify-player` client automatically follows your terminal’s color scheme.  
   > For example, if your **Kitty** terminal uses a greenish theme, the player will match it automatically.

3. **Enable and start the Spotify daemon:**
   ```bash
   systemctl --user enable spotifyd
   systemctl --user start spotifyd
   ```

---

## 💻 Neovim + LunarVim Setup

1. **Install Neovim and required dependencies:**
   ```bash
   sudo pacman -S --needed neovim git curl nodejs npm python-pynvim ripgrep fd clang
   ```

2. **Install LunarVim:**
   ```bash
   bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/master/utils/installer/install.sh)
   ```

3. **Add LunarVim to your PATH (if not already):**
   ```bash
   echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
   source ~/.bashrc
   ```

4. **Run LunarVim for the first time:**
   ```bash
   lvim
   ```

---

## ⚙️ Final Step — Apply Configurations

After installing everything, run the provided setup script:
```bash
./setup.sh
```

This script will:
- Copy all configuration files to their correct locations inside `~/.config`
- Apply your pre-defined settings for **Hyprland**, **Kitty**, **LunarVim**, and other tools

---

✅ Once `setup.sh` finishes, your system will be fully configured and ready to use:  
Spotify runs in the background, the CLI player matches your Kitty theme, and LunarVim is installed with your custom configuration.

