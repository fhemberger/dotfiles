brew install \
  1password \
  alfred \
  appcleaner \
  betterzip \
  docker \
  flux \
  fork \
  google-chrome \
  imagealpha \
  imageoptim \
  iterm2 \
  ql-ansilove \
  qlcolorcode \
  qlmarkdown \
  qlmobi \
  qlstephen \
  quicklook-csv \
  quicklook-json \
  rectangle \
  spotify \
  sublime-text \
  syncthing \
  the-unarchiver \
  visual-studio-code \
  WebPQuickLook

# Add itermcolors to iTerm configuration
IFS=$'\n'
installed_themes=$(defaults read "$CHEZMOI_HOME_DIR/Library/Preferences/com.googlecode.iterm2.plist" "Custom Color Presets" | grep -oP '^\s{4}\K(\w|").*"?(?= =)' | tr -d '"')
available_themes=$(find "$CHEZMOI_SOURCE_DIR/itermcolors/" -name "*.itermcolors" -exec basename "{}" .itermcolors \; | sort)

installable_themes=$(comm -23 <(echo "$available_themes") <(echo "$installed_themes"))
for theme in $installable_themes; do
  open "$CHEZMOI_SOURCE_DIR/itermcolors/$theme.itermcolors"
done
