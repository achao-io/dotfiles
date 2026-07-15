# ----------------------------------------------------------------------------
# Oh My Zsh
# ----------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(git z dotenv kubectl zsh-syntax-highlighting)

source "$ZSH/oh-my-zsh.sh"

# ----------------------------------------------------------------------------
# PATH
# ----------------------------------------------------------------------------
# Homebrew (Apple Silicon) + GNU coreutils
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# Tool-specific paths (one line each — later entries win)
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"   # Java 11 for sqlpen

# ----------------------------------------------------------------------------
# Tool initialization
# ----------------------------------------------------------------------------
export PIPX_HOME="$HOME/.local/pipx"
export PIPX_BIN_DIR="$HOME/.local/bin"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
pyenv() {
  unset -f pyenv
  eval "$(command pyenv init -)"
  eval "$(command pyenv virtualenv-init -)"
  pyenv "$@"
}

# nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
eval "$(fnm env --use-on-cd)"

# gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# envman (generated — do not edit)
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Load SSH keys from macOS keychain (silent)
/usr/bin/ssh-add --apple-load-keychain >/dev/null 2>&1

# ----------------------------------------------------------------------------
# Build flags (Odin / mysql@8.0)
# ----------------------------------------------------------------------------
export LDFLAGS="-L/opt/homebrew/opt/mysql@8.0/lib"
export CPPFLAGS="-I/opt/homebrew/opt/mysql@8.0/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql@8.0/lib/pkgconfig"

# Fix scipy install error on macOS
# https://github.com/scipy/scipy/issues/13102#issuecomment-788160041
export SYSTEM_VERSION_COMPAT=0

# ----------------------------------------------------------------------------
# Work (Slack)
# ----------------------------------------------------------------------------
source "$HOME/.slack_webapp_artifactory"

# Artifactory credentials — moved OUT of this file into ~/.secrets
[ -s "$HOME/.secrets" ] && source "$HOME/.secrets"

# Kubeconfig
export KUBECONFIG="$KUBECONFIG:$HOME/.kube/config-commercial:$HOME/.kube/config"

# Claude Code via Bedrock
export CLAUDE_CODE_USE_BEDROCK=1

# ----------------------------------------------------------------------------
# Aliases
# ----------------------------------------------------------------------------
alias sbk='slack-beach -r kube-beach'
alias sbo='slack-beach -r ops'
alias vim='nvim'
alias ls='lsd -lah'
alias sc='slack claude'
alias path='echo $PATH | tr ":" "\n"'
