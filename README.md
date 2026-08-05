As of 2026-07-14, I use [WezTerm](https://wezterm.org/), [LazyVim](https://www.lazyvim.org/), and [tmux](https://github.com/tmux/tmux/wiki).

Organized by topic, one directory per tool — inspired by
[ryanb/dotfiles](https://github.com/ryanb/dotfiles) and
[holman/dotfiles](https://github.com/holman/dotfiles). Adding a tmux binding means
opening `tmux/`, not hunting through a kitchen-sink file.

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
| `tools.zsh` | pyenv, fnm, gvm, envman, ssh-agent, build flags |
| `work.zsh` | Slack artifactory, kubeconfig, Bedrock |
| `aliases.zsh` | shell aliases |

Sourced in an explicit order rather than by glob: `path` has to precede `tools`,
and `aliases` has to follow oh-my-zsh. Set `ZSH_CONFIG` to source them from
somewhere other than `~/dotfiles/zsh`.

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

## Secrets

Nothing secret belongs in this repo. `zsh/work.zsh` sources `~/.secrets` and
`~/.slack_webapp_artifactory` if they exist; keep credentials there.
