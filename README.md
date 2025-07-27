All my configs and steps to get going. Based on [MacOS](https://www.apple.com/os/macos/), [wezterm](https://wezfurlong.org/wezterm/), [lazyvim](https://www.lazyvim.org) and [tmux](https://github.com/tmux/tmux/wiki). Most things should work in Ubuntu also.

## MacOS

- System Settings > Desktop and Dock >
  - Disable "Show recent applications in dock"
  - Enable "Automatically hide and show the Dock"
  - Disable "Automatically rearrange spaces based on most recent use"
- Install homebrew

  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

- Install the font

  ```
  brew install font-fira-code
  ```

- Clone this repo locally in `~/.config`. You might want to backup existing configs

  ```
  git clone https://github.com/oddgr8/.config.git ~/.config
  ```

- Install [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) and set it to default.
- Add this to `~/.zshenv` so configs are picked up correctly.

  ```
  export XDG_CONFIG_HOME=$HOME/.config
  ```

  **Reminder**:
  - `.zshenv`: Runs _first_ in *all* shells. Set base variable here, like [XDG Base Variables](https://specifications.freedesktop.org/basedir-spec/latest/)
  - `.zshrc`: Runs in *interactive* shells. These are shells you can type commands into.
  - `.zprofile`: : Runs in *login* shells. These are shells in _new_ terminals.
  Set `PATH` in `.zprofile`, **not** `.zshrc`, to avoid inconsistencies between parent and child shells. Typical entry you want in `.zprofile`:

  ```
  export PATH=$HOME/bin:$HOME/.local/bin:/opt/homebrew/bin:/usr/local/bin:$PATH 
  ```

- Install and enable [Karabiner](https://karabiner-elements.pqrs.org). Caps lock is now Escape when pressed alone and Control when pressed with other keys.

## Terminal emulator setup

- Install and run [wezterm](https://wezfurlong.org/wezterm/)
- Config should automatically be loaded from the repo

## Shell setup

- Install [oh-my-zsh](https://ohmyz.sh/)

  ```
  sh -c "$(curl -fsSL https://install.ohmyz.sh/)"
  ```

- This probably modified your `.zshrc` file. Revert it

  ```
  cp .zshrc.pre-oh-my-zsh .zshrc
  rm .zshrc.pre-oh-my-zsh
  ```

- Instead, add this to the top of your `zshrc`. This might cause some warnings but they should resolve once you install all further packages.

  ```
  # Load theme, plugins and aliases
  source $HOME/.config/zsh/zshrc
  ```

- Install [tmux](https://github.com/tmux/tmux/wiki), [make](https://www.gnu.org/software/make/manual/make.html), [curl](https://curl.se), [wget](https://www.gnu.org/software/wget/) and [fzf](https://junegunn.github.io/fzf/)

  ```
  brew install tmux make curl wget fzf 
  ```

- Install [rust](https://www.rust-lang.org)

  ```
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  ```

- Install [lsd](https://github.com/lsd-rs/lsd), [ripgrep](https://github.com/BurntSushi/ripgrep), [zoxide](https://github.com/ajeetdsouza/zoxide), [fd](https://github.com/sharkdp/fd), [bat](https://github.com/sharkdp/bat) and [delta](https://github.com/dandavison/delta). The version of `bat` has to exactly match the one being used by `git-delta`

  ```
  cargo install --locked lsd ripgrep zoxide fd-find git-delta@0.18.2 bat@0.24.0
  ```
  
  You might have to run `bat cache --clear && bat cache --build` for everything to work properly

- Install [powerlevel10k](https://github.com/romkatv/powerlevel10k) and zsh plugins.

  ```
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
  git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode
  git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/alias-tips
  git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
  ```

- Restart Terminal

## Tmux

- Install [tmux](https://github.com/tmux/tmux/wiki)

  ```
  brew install tmux
  ```

- Config should automatically be loaded from the repo
- Install [TPM](https://github.com/tmux-plugins/tpm)

  ```
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ```

- Finish setup by pressing `Ctrl+A I` inside tmux. Might take a few seconds to take effect.

## Lazyvim

- Install [Lazyvim](https://www.lazyvim.org)
- Config should automatically be loaded from the repo

## Version Managers

- You probably want to install version managers for the usual suspects: [nvm](https://github.com/nvm-sh/nvm), [gvm](https://github.com/moovweb/gvm), [uv](https://github.com/astral-sh/uv) and [pyenv](https://github.com/pyenv/pyenv)
