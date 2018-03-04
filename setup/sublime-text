if [[ `uname` == "Darwin" ]]; then
  ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
else
  sudo ln -s /opt/sublime/sublime_text /usr/local/bin/subl
fi

# https://stackoverflow.com/questions/8299610/zsh-command-not-found-for-editor/10889176#10889176
cat > /usr/local/bin/EDITOR <<EOF
#!/bin/sh
subl -w "$@"
EOF
sudo chmod +x /usr/local/bin/EDITOR

cat >> ~/.extra <<EOF
export EDITOR="/usr/local/bin/EDITOR"
export GIT_EDITOR="/usr/local/bin/EDITOR"
EOF


