sudo apt-get update
sudo apt-get install -y \
  bat \
  colordiff \
  curl \
  fd-find \
  fish \
  fzf \
  htop \
  jq \
  nano \
  ncdu \
  neovim \
  ufw \
  unp \
  zsh

sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# Install git diff syntax highlighter
(
version="$(curl --silent "https://api.github.com/repos/dandavison/delta/releases/latest" | jq -r ".tag_name")"
url="https://github.com/dandavison/delta/releases/download/${version}/git-delta_${version}_$(dpkg --print-architecture).deb"
wget "$url"
filename="$(basename "$url")"
sudo dpkg -i "$filename"
rm "$filename" || true
)

# Disable Ubuntu motd spam
# https://eklitzke.org/disabling-ubuntu-motd-spam
if [ -f /etc/default/motd-news ]; then
  sudo sed -i 's/^ENABLED=.*/ENABLED=0/' /etc/default/motd-news
fi

# Disable sudo password for current user
(
cat <<-EOF
# User rules for $USER
$USER ALL=(ALL) NOPASSWD:ALL
EOF
) | sudo tee "/etc/sudoers.d/$USER" > /dev/null
