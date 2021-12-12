if type -q "git"
  alias g="git"

  function gitclonecd
    set -l base (basename "$argv[1]" .git)
    set -q argv[2]
    or set argv[2] $base

    git clone $argv && cd "$argv[2]" || return
  end

  alias gccd=gitclonecd
end
