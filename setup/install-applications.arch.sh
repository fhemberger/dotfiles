sudo pacman -S --noconfirm --needed \
  alacritty \
  bc \
  dunst \
  feh \
  i3-gaps \
  i3lock-color \
  libnotify \
  noto-fonts \
  noto-fonts-emoji \
  numlockx \
  otf-libertinus \
  picom \
  python-pywal \
  redshift \
  rofi \
  tex-gyre-fonts \
  ttf-dejavu \
  ttf-fira-mono \
  ttf-font-awesome \
  udiskie \
  udisks2 \
  ueberzug \
  xorg-server \
  xorg-xinit

paru -S --noconfirm --needed \
  betterlockscreen \
  polybar \
  nerd-fonts-meslo

# https://wiki.manjaro.org/index.php?title=Improve_Font_Rendering
# https://aswinmohan.me/posts/better-fonts-on-linux/
(
cat <<-FONTSETTINGS
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>

  <match target="font">
    <edit name="autohint" mode="assign">
      <bool>true</bool>
    </edit>
    <edit name="hinting" mode="assign">
      <bool>true</bool>
    </edit>
    <edit mode="assign" name="hintstyle">
      <const>hintslight</const>
    </edit>
    <edit mode="assign" name="lcdfilter">
     <const>lcddefault</const>
   </edit>
  </match>

  <!-- Default sans-serif font -->
  <match target="pattern">
    <test qual="any" name="family"><string>-apple-system</string></test>
    <edit name="family" mode="prepend" binding="same"><string>Tex Gyre Heros</string></edit>
  </match>

  <match target="pattern">
    <test qual="any" name="family"><string>Helvetica Neue</string></test>
    <edit name="family" mode="prepend" binding="same"><string>Tex Gyre Heros</string></edit>
  </match>

  <match target="pattern">
    <test qual="any" name="family"><string>Helvetica</string></test>
    <edit name="family" mode="prepend" binding="same"><string>Tex Gyre Heros</string></edit>
  </match>

  <match target="pattern">
    <test qual="any" name="family"><string>arial</string></test>
    <edit name="family" mode="prepend" binding="same"><string>Tex Gyre Heros</string></edit>
  </match>

  <match target="pattern">
    <test qual="any" name="family"><string>sans-serif</string></test>
    <edit name="family" mode="prepend" binding="same"><string>Tex Gyre Heros</string></edit>
  </match>

  <!-- Default serif fonts -->
  <match target="pattern">
    <test qual="any" name="family"><string>serif</string></test>
    <edit name="family" mode="prepend" binding="same"><string>Libertinus Serif</string></edit>
    <edit name="family" mode="prepend" binding="same"><string>Noto Serif</string></edit>
    <edit name="family" mode="prepend" binding="same"><string>Noto Color Emoji</string></edit>
    <edit name="family" mode="append" binding="same"><string>IPAPMincho</string></edit>
    <edit name="family" mode="append" binding="same"><string>HanaMinA</string></edit>
  </match>

  <!-- Default monospace fonts -->
  <match target="pattern">
    <test qual="any" name="family"><string>SFMono-Regular</string></test>
    <!-- <edit name="family" mode="prepend" binding="same"><string>DM Mono</string></edit> -->
    <edit name="family" mode="prepend" binding="same"><string>Space Mono</string></edit>
    <edit name="family" mode="append" binding="same"><string>Inconsolatazi4</string></edit>
    <edit name="family" mode="append" binding="same"><string>IPAGothic</string></edit>
  </match>

  <match target="pattern">
    <test qual="any" name="family"><string>Menlo</string></test>
    <!-- <edit name="family" mode="prepend" binding="same"><string>DM Mono</string></edit> -->
    <edit name="family" mode="prepend" binding="same"><string>Space Mono</string></edit>
    <edit name="family" mode="append" binding="same"><string>Inconsolatazi4</string></edit>
    <edit name="family" mode="append" binding="same"><string>IPAGothic</string></edit>
  </match>

  <match target="pattern">
    <test qual="any" name="family"><string>monospace</string></test>
    <!-- <edit name="family" mode="prepend" binding="same"><string>DM Mono</string></edit> -->
    <edit name="family" mode="prepend" binding="same"><string>Space Mono</string></edit>
    <edit name="family" mode="append" binding="same"><string>Inconsolatazi4</string></edit>
    <edit name="family" mode="append" binding="same"><string>IPAGothic</string></edit>
  </match>

  <!-- Fallback fonts preference order -->
  <alias>
    <family>sans-serif</family>
    <prefer>
      <family>Noto Sans</family>
      <family>Noto Color Emoji</family>
      <family>Noto Emoji</family>
      <family>Open Sans</family>
      <family>Droid Sans</family>
      <family>Ubuntu</family>
      <family>Roboto</family>
      <family>NotoSansCJK</family>
      <family>Source Han Sans JP</family>
      <family>IPAPGothic</family>
      <family>VL PGothic</family>
      <family>Koruri</family>
    </prefer>
  </alias>
  <alias>
    <family>serif</family>
    <prefer>
      <family>Noto Serif</family>
      <family>Noto Color Emoji</family>
      <family>Noto Emoji</family>
      <family>Droid Serif</family>
      <family>Roboto Slab</family>
      <family>IPAPMincho</family>
    </prefer>
  </alias>
  <alias>
    <family>monospace</family>
    <prefer>
      <family>Noto Sans Mono</family>
      <family>Noto Color Emoji</family>
      <family>Noto Emoji</family>
      <family>Inconsolatazi4</family>
      <family>Ubuntu Mono</family>
      <family>Droid Sans Mono</family>
      <family>Roboto Mono</family>
      <family>IPAGothic</family>
    </prefer>
  </alias>

</fontconfig>
FONTSETTINGS
) | sudo tee /etc/fonts/local.conf > /dev/null

# https://wiki.archlinux.org/index.php/Udisks#Mount_to_.2Fmedia_.28udisks2.29
(
cat <<-UDISKS2
# UDISKS_FILESYSTEM_SHARED
# ==1: mount filesystem to a shared directory (/media/VolumeName)
# ==0: mount filesystem to a private directory (/run/media/$USER/VolumeName)
# See udisks(8)
ENV{ID_FS_USAGE}=="filesystem|other|crypto", ENV{UDISKS_FILESYSTEM_SHARED}="1"
UDISKS2
) | sudo tee /etc/udev/rules.d/99-udisks2.rules > /dev/null

(
cat <<-TMPFS_MEDIA
D /media 0755 root root 0 -
TMPFS_MEDIA
) | sudo tee /etc/tmpfiles.d/media.conf > /dev/null
