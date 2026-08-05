#!/usr/bin/env bash
# Symlinks configs from this repo into place. Safe to re-run.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$REPO/$1" dest="$2"
  if [ ! -e "$src" ]; then
    echo "missing  $src" >&2
    return 1
  fi
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "ok       $dest"
    return
  fi
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mv "$dest" "$dest.bak.$$"
    echo "backup   $dest -> $dest.bak.$$"
  fi
  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "linked   $dest"
}

link nvim "$HOME/.config/nvim"
link zsh/zshrc "$HOME/.zshrc"
link wezterm/wezterm.lua "$HOME/.config/wezterm/wezterm.lua"
# File-level, not the directory: ~/.config/tmux/plugins is TPM-managed.
link tmux/tmux.conf "$HOME/.config/tmux/tmux.conf"
link git/gitconfig "$HOME/.gitconfig"
link git/gitignore_global "$HOME/.gitignore_global"
# File-level: ~/.claude also holds plugin caches and local state.
link claude/settings.json "$HOME/.claude/settings.json"
link claude/CLAUDE.md "$HOME/.claude/CLAUDE.md"
