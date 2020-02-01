#!/usr/bin/env zsh

if [ "${commands[serverless]}" ]; then
  serverless() {
    unfunction "$0"

    # tabtab source for serverless package
    # uninstall by removing these lines or running `tabtab uninstall serverless`
    [[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh

    $0 "$@"
  }

  sls() {
    unfunction "$0"

    # tabtab source for sls package
    # uninstall by removing these lines or running `tabtab uninstall sls`
    [[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
    $0 "$@"
  }
fi

