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
alias lsd='ls | lolcat'

# -- Keybindings --------------------------------------------------------------
set -gx EDITOR nano
bind \ce edit_command_buffer

# -- Linxu: Start X at login --------------------------------------------------
if test (uname) = "Linux"
  and status is-login
  and test -z "$DISPLAY" -a "$XDG_VTNR" = 1
  exec startx -- -keeptty
end

# -- macOS: Paths -------------------------------------------------------------
if test (uname) = "Darwin"
  set HOMEBREW_NO_ANALYTICS 1
  set GOBIN $HOME/go/bin

  set    PATH /usr/local/opt/openssl/bin
  set -a PATH /usr/local/opt/grep/libexec/gnubin
  set -a PATH /usr/local/opt/coreutils/libexec/gnubin
  set -a PATH /usr/local/opt/go/libexec/bin
  set -a PATH $GOBIN
  set -a PATH /usr/local/opt/python@3.8/bin
  set -a PATH $HOME/Library/Python/3.8/bin
  set -a PATH /usr/local/bin
  set -a PATH /usr/local/sbin
  set -a PATH /usr/bin
  set -a PATH /usr/sbin
  set -a PATH /bin
  set -a PATH /sbin

  launchctl setenv PATH $PATH
end
