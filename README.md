# Configs and dotfiles

All my configs and steps to get going. Based on
[wezterm](https://wezfurlong.org/wezterm/),
[zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH),
[lazyvim](https://www.lazyvim.org)
and [tmux](https://github.com/tmux/tmux/wiki). Most things should work in Ubuntu
also.

## MacOS

Should run fine with minor modifications for Ubuntu.

- System Settings > Desktop and Dock >
  - Disable "Show recent applications in dock"
  - Enable "Automatically hide and show the Dock"
  - Disable "Automatically rearrange spaces based on most recent use"

- Install homebrew.

  ```sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

- Install the [font](https://github.com/tonsky/FiraCode) and [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

  ```sh
  brew install font-fira-code zsh
  ```

- Install and enable [Karabiner](https://karabiner-elements.pqrs.org). After config is loaded Caps lock
  will be Escape when pressed alone and Control when pressed with other keys.

## Shell

- Add this to `~/.zshenv` so configs are picked up correctly.

  ```sh
  export XDG_CONFIG_HOME=$HOME/.config
  ```

  **Reminder**:
  - `.zshenv`: Runs _first_ in _all_ shells. Set base variable here, like
    [XDG Base Variables](https://specifications.freedesktop.org/basedir-spec/latest/)
  - `.zshrc`: Runs in _interactive_ shells. These are shells you can type
    commands into. Every sub-shell will invoke this.
  - `.zprofile`: : Runs in _login_ shells. These are shells in _new_ terminals.
    Set `PATH` in `.zprofile`, **not** `.zshrc`, to avoid inconsistencies
    between parent and child shells.

- Restart terminal

- Clone this repo. You might want to backup existing configs.
  Restarting terminal might show some errors as all things are not yet installed.

  ```sh
  git clone https://github.com/oddgr8/.config.git $XDG_CONFIG_HOME
  ```

## Shell and tmux

- Install [tmux](https://github.com/tmux/tmux/wiki),
  [make](https://www.gnu.org/software/make/manual/make.html),
  [curl](https://curl.se), [wget](https://www.gnu.org/software/wget/).

  ```sh
  brew install tmux make curl wget # MacOS
  apt install tmux make curl wget # ubuntu
  ```

- Install [lazygit](https://github.com/jesseduffield/lazygit) and
  [fzf](https://junegunn.github.io/fzf/)

- Install [oh-my-zsh](https://ohmyz.sh/).

  ```sh
  KEEP_ZSHRC=yes RUNZSH=no sh -c "$(curl -fsSL https://install.ohmyz.sh/)"
  ```

- Add this to the top of your `zshrc`. This might cause some warnings
  but they should resolve once you install all further packages.

  ```sh
  # Load theme, plugins and aliases
  source $HOME/.config/zsh/zshrc
  ```

- Install [rust](https://www.rust-lang.org).

  ```sh
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  ```

- Install [lsd](https://github.com/lsd-rs/lsd),
  [ripgrep](https://github.com/BurntSushi/ripgrep),
  [zoxide](https://github.com/ajeetdsouza/zoxide),
  [fd](https://github.com/sharkdp/fd),
  [du-dust](https://github.com/bootandy/dust),
  [procs](https://github.com/dalance/procs),
  [bat](https://github.com/sharkdp/bat) and
  [delta](https://github.com/dandavison/delta). The version of `bat` has to
  exactly match the one being used by `git-delta`.

  ```sh
  cargo install --locked lsd ripgrep zoxide fd-find du-dust procs git-delta@0.18.2 bat@0.24.0
  ```

  You might have to run `bat cache --clear && bat cache --build` for everything
  to work properly.

- Install [TPM](https://github.com/tmux-plugins/tpm),
  [powerlevel10k](https://github.com/romkatv/powerlevel10k) and zsh
  plugins.

  ```sh
  # TPM
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  # p10k
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

  # zsh plugins
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
  git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode
  git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/alias-tips
  git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
  ```
  
- Config should automatically be loaded from the repo

- Open tmux and press `Ctrl+A I` inside it. Might take a few seconds to
  take effect.

## Terminal emulator

- Install and run [wezterm](https://wezfurlong.org/wezterm/).
- Config should automatically be loaded from the repo

## Lazyvim

- Install [Lazyvim](https://www.lazyvim.org)
- Config should automatically be loaded from the repo
