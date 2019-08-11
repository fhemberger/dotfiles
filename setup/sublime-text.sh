# macOS
if [[ -f "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ]]; then
  ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
fi

# Linux
if [[ -f "/opt/sublime/sublime_text" ]]; then
  ln -s /opt/sublime/sublime_text /usr/local/bin/subl
fi
