#!/usr/bin/env bash
set -euo pipefail

echo "=== Running setup for Hyprland + zsh + kitty (Arch) ==="

########################################
# 1) EXISTING THEME INSTALL (unchanged)
########################################

echo "== Installing required theme/fonts =="

##INSTALLING REQUIRED THEME
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/3270.zip -O /tmp/3270.zip && \
mkdir -p ~/.local/share/fonts/NerdFonts && \
unzip -o /tmp/3270.zip -d ~/.local/share/fonts/NerdFonts && \
fc-cache -fv 

########################################
# 2) CHECK THAT WE ARE ON AN ARCH SYSTEM
########################################

if ! command -v pacman >/dev/null 2>&1; then
  echo "This script is written for Arch/Arch-based systems (pacman)."
  echo "pacman not found. Exiting to avoid breaking your system."
  exit 1
fi

########################################
# 3) INSTALL HYPRLAND + HYPRLOCK + TOOLS
########################################

echo "== Installing Hyprland, hyprlock, kitty, zsh and related tools =="

sudo pacman -Syu --needed \
  hyprland \
  hyprlock \
  waybar \
  wofi \
  kitty \
  zsh \
  xdg-desktop-portal-hyprland \
  xorg-xwayland \
  mesa \
  vulkan-intel \
  intel-media-driver \
  noto-fonts \
  noto-fonts-cjk \
  noto-fonts-emoji \
  ttf-nerd-fonts-symbols-mono

########################################
# 4) SET ZSH AS DEFAULT SHELL
########################################

echo "== Setting zsh as default shell =="

# make sure /bin/zsh is in /etc/shells
if ! grep -q '/bin/zsh' /etc/shells; then
  echo "Adding /bin/zsh to /etc/shells"
  echo "/bin/zsh" | sudo tee -a /etc/shells >/dev/null
fi

if [ "${SHELL:-}" != "/bin/zsh" ]; then
  chsh -s /bin/zsh "$USER" || echo "Could not change shell automatically. Run: chsh -s /bin/zsh"
fi

########################################
# 5) COPY PRECONFIGURED CONFIGS TO ~/.config
########################################

echo "== Copying repo configs (hypr, kitty, nvim, rofi) to ~/.config =="

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
CONFIG_TARGET="$HOME/.config"

mkdir -p "$CONFIG_TARGET"

for dir in hypr kitty nvim rofi; do
  SRC="$SCRIPT_DIR/$dir"
  DEST="$CONFIG_TARGET/$dir"

  if [ -d "$SRC" ]; then
    # backup existing config if present
    if [ -e "$DEST" ]; then
      ts="$(date +%Y%m%d-%H%M%S)"
      BACKUP="${DEST}.bak-${ts}"
      echo "Backing up existing $DEST -> $BACKUP"
      mv "$DEST" "$BACKUP"
    fi

    echo "Copying $SRC -> $DEST"
    cp -r "$SRC" "$DEST"
  else
    echo "Note: $SRC does not exist in repo, skipping."
  fi
done

########################################
# 6) AUTO-START HYPRLAND FROM ZSH LOGIN
########################################

echo "== Configuring ~/.zshrc to auto start Hyprland on TTY1 =="

ZSHRC="$HOME/.zshrc"

# Create .zshrc if it doesn't exist
if [ ! -f "$ZSHRC" ]; then
  touch "$ZSHRC"
fi

# Only add block if not already present
if ! grep -q 'exec Hyprland' "$ZSHRC"; then
  cat >> "$ZSHRC" <<'EOF'

# --- Auto-start Hyprland on first TTY login ---
# This will start Hyprland automatically when you log in on TTY1.
# It will NOT trigger inside graphical terminals or other TTYs.
if [[ -z "$WAYLAND_DISPLAY" && -z "$DISPLAY" && "${XDG_VTNR:-0}" -eq 1 ]]; then
  exec Hyprland
fi
# --- End Hyprland auto-start block ---

EOF

  echo "Added Hyprland auto-start block to $ZSHRC"
else
  echo "Hyprland auto-start block already present in $ZSHRC – not duplicating."
fi

########################################
# 7) DONE
########################################

echo
echo "=== All done! ==="
echo "- Your original theme install commands are still there."
echo "- Hyprland + hyprlock + kitty + Intel drivers are installed."
echo "- zsh is set as your default shell (or at least attempted)."
echo "- Preconfigured hypr/kitty/nvim/rofi from this repo are now in ~/.config (old ones backed up)."
echo "- Logging in on TTY1 should auto-start Hyprland via ~/.zshrc."
echo

