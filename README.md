## Install

```sh
git clone https://github.com/achao-io/dotfiles ~/dotfiles
~/dotfiles/install.sh
```

Anything already at a destination is moved aside to `*.bak.$$` rather than
overwritten. Re-running is a no-op for links already pointing at this repo.

tmux and Claude link individual files rather than their directories, since
`~/.config/tmux/plugins` is [TPM](https://github.com/tmux-plugins/tpm)-managed and
`~/.claude` holds plugin caches and local state.

## Layout

```
claude/     settings.json, CLAUDE.md  -> ~/.claude/
git/        gitconfig, gitignore_global
nvim/       LazyVim config            -> ~/.config/nvim
tmux/       tmux.conf                 -> ~/.config/tmux/tmux.conf
wezterm/    wezterm.lua               -> ~/.config/wezterm/wezterm.lua
zsh/        zshrc + topic files       -> ~/.zshrc
install.sh
```

Everything is symlinked out of this repo, so editing a config in place is
immediately visible to `git status` — no copy step to forget.

## zsh

`zshrc` handles oh-my-zsh and the prompt, then sources one file per topic:

| file | holds |
| --- | --- |
| `path.zsh` | homebrew, coreutils, tool-specific `PATH` entries |
| `tools.zsh` | pipx, fnm, gvm, envman, ssh-agent |
| `aliases.zsh` | shell aliases |

Sourced in an explicit order rather than by glob: `path` has to precede `tools`,
and `aliases` has to follow oh-my-zsh. Set `ZSH_CONFIG` to source them from
somewhere other than `~/dotfiles/zsh`.
