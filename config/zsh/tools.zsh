export PIPX_HOME="$HOME/.local/pipx"
export PIPX_BIN_DIR="$HOME/.local/bin"

# pyenv init is slow; defer it until first use
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
pyenv() {
  unset -f pyenv
  eval "$(command pyenv init -)"
  eval "$(command pyenv virtualenv-init -)"
  pyenv "$@"
}

# node (fnm replaced nvm)
command -v fnm >/dev/null && eval "$(fnm env --use-on-cd)"

# gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# envman (generated — do not edit)
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Load SSH keys from macOS keychain (silent)
/usr/bin/ssh-add --apple-load-keychain >/dev/null 2>&1

# Build flags (Odin / mysql@8.0)
export LDFLAGS="-L/opt/homebrew/opt/mysql@8.0/lib"
export CPPFLAGS="-I/opt/homebrew/opt/mysql@8.0/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql@8.0/lib/pkgconfig"

# Fix scipy install error on macOS
# https://github.com/scipy/scipy/issues/13102#issuecomment-788160041
export SYSTEM_VERSION_COMPAT=0
