if [[ "$(uname)" == "Darwin" ]]; then
  # Browsers
  alias chrome='open -a "Google Chrome"'
  alias safari='open -a Safari'
  alias firefox='open -a Firefox'

  # Bossmode
  alias su="sudo -i"

  # Reset LaunchService database
  alias reset-launchservices="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user"

  # Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
  alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update'

  # Kill all the tabs in Chrome to free up memory
  # [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
  alias chromekill="ps ux | grep '[C]hrome Helper (Renderer) --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

  # Remove homebrew packages with dependencies
  brew-rm () {
    brew rm $(brew deps $1) $1
  }

  alias tac=gtac
fi
