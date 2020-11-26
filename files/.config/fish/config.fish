# -- Aliases ------------------------------------------------------------------
if type -q "pip3"
  alias pip3-outdated='pip3 list --outdated --format=freeze'
end

if type -q "subl"
  alias s=subl
end

if type -q "ncdu"
  alias ncdu='ncdu --color dark'
end

# Make sure to have installed coreutils using `brew install coreutils`.
# Otherwise use `alias ls="ls -lAhGO"` on macOS for the same results.
alias ls="ls -lAh --color=auto --group-directories-first"

# -- Keybindings --------------------------------------------------------------
set -gx EDITOR nano
bind \ce edit_command_buffer

# -- PATH ---------------------------------------------------------------------
set -p PATH ~/.local/bin/

# -- Linxu: Start X at login --------------------------------------------------
if test (uname) = "Linux"
  and status is-login
  and test -z "$DISPLAY" -a "$XDG_VTNR" = 1
  if type -q "wal"
    wal -i ~/.wallpaper
  end
  exec startx -- -keeptty
end

# -- Linux: Set terminal colors -----------------------------------------------
if type -q "wal"
  cat ~/.cache/wal/sequences &
end

# -- macOS: Paths -------------------------------------------------------------
if test (uname) = "Darwin"
  set HOMEBREW_NO_ANALYTICS 1

  set -p PATH /usr/local/opt/coreutils/libexec/gnubin
  set -p PATH /usr/local/opt/findutils/libexec/gnubin
  set -p PATH /usr/local/opt/grep/libexec/gnubin
  set -p PATH /usr/local/opt/openssl/bin

  if type -q "go"
    set GOBIN $HOME/go/bin

    set -p PATH /usr/local/opt/go/libexec/bin
    set -p PATH $GOBIN
  end


  launchctl setenv PATH "$PATH"
end
