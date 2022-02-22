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
