As of 2026-07-14, I use [WezTerm](https://wezterm.org/), [LazyVim](https://www.lazyvim.org/), and [tmux](https://github.com/tmux/tmux/wiki).

Organized by topic, one directory per tool — inspired by
[holman/dotfiles](https://github.com/holman/dotfiles) and
[ryanb/dotfiles](https://github.com/ryanb/dotfiles). Adding a tmux binding means
opening `config/tmux/`, not hunting through a kitchen-sink file.

## Layout

```
config/
  nvim/       LazyVim config      -> ~/.config/nvim
  tmux/       tmux.conf           -> ~/.config/tmux/tmux.conf
  wezterm/    wezterm.lua         -> ~/.config/wezterm/wezterm.lua
  zsh/        zshrc               -> ~/.zshrc
install.sh
```

Everything is symlinked out of this repo, so editing a config in place is
immediately visible to `git status` — no copy step to forget.

## Install

```sh
git clone https://github.com/achao-io/dotfiles ~/dotfiles
~/dotfiles/install.sh
```

Anything already at a destination is moved aside to `*.bak.$$` rather than
overwritten. Re-running is a no-op for links already pointing at this repo.

tmux is linked as a single file, not a directory, because `~/.config/tmux/plugins`
is managed by [TPM](https://github.com/tmux-plugins/tpm) and shouldn't be tracked
here.

## Secrets

Nothing secret belongs in this repo. `config/zsh/zshrc` sources `~/.secrets` if it
exists; keep credentials there.
