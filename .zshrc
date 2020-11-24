autoload -Uz compinit
compinit

eval "$(direnv hook zsh)"

# alias vim=/usr/local/bin/vim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export FZF_TMUX=1
export FZF_TMUX_HEIGHT=40%
# export PATH=/Library/Frameworks/Python.framework/Versions/3.90/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"

# hub pull-request checkout
hbr() {
  local pr
  pr=$(
    gh pr list --limit 100 \
      | fzf-tmux --preview 'gh pr view -p {1}' \
      | cut -f1
  )
  if [ -z $pr ]; then
    return
  fi
  gh pr checkout $pr
}

# hub browse any repository
hshow() {
  local repo
  repo=$(ghq list | fzf-tmux +m | cut -d '/' -f 2,3)
  if [ -z $repo ]; then
    return
  fi
  hub browse $repo
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/naohirouesugi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/naohirouesugi/google-cloud-sdk/path.zsh.inc'; fi

export PATH=${0:A:h}/bin:$PATH
# The next line enables shell command completion for gcloud.
if [ -f '/Users/naohirouesugi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/naohirouesugi/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
