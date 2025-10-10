
##INSTALLING REQUIRED THEME
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/3270.zip -O /tmp/3270.zip && \
mkdir -p ~/.local/share/fonts/NerdFonts && \
unzip -o /tmp/3270.zip -d ~/.local/share/fonts/NerdFonts && \
fc-cache -fv 
