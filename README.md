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
- Add this to `~/.zshenv`.

  ```
  export XDG_CONFIG_HOME=$HOME/.config
  ```

  **Reminder**: `.zshenv` _always_ runs first. That means in shells, sub-shells, tmux, nvim, everything. Only put things needed everywhere. Like XDG variables.
  **Reminder**: `.zprofile` runs on login shells. This means every time you manually open a terminal. That's it. Not in sub-shells, not in tmux, not in nvim, nowhere. This is where you want to manipulate `$PATH`. That `$PATH` will get inherited by all subshells and subprocesses, just as it should be. If you prepend to `$PATH` in `.zshrc`, it will re-run on every sub-shell. This means tmux, nvim and subprocesses can end up running different executables than its parent. You _don't_ want that. Also, here's the typical `$PATH` you will need so it's a good idea to put this in your `.zprofile` right now.

  ```
  export PATH=$HOME/bin:$HOME/.local/bin:/opt/homebrew/bin:/usr/local/bin:$PATH 
  ```

  **Reminder**: `.zshrc` runs on every interactive shell. This means tmux, nvim and even subprocesses. Only do things that affect interaction here, like setting up prompt or colors.

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

- Install [tmux](https://github.com/tmux/tmux/wiki), [zsh](https://zsh.sourceforge.io), [make](https://www.gnu.org/software/make/manual/make.html), [pip](https://pypi.org/project/pip/) [curl](https://curl.se), [wget](https://www.gnu.org/software/wget/), [zoxide](https://github.com/ajeetdsouza/zoxide), [fzf](https://junegunn.github.io/fzf/), [delta](https://github.com/dandavison/delta) and [bat](https://github.com/sharkdp/bat)

  ```
  brew install tmux make curl wget zoxide fzf git-delta bat
  ```

- Install [rust](https://www.rust-lang.org)

  ```
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  ```

- Install [lsd](https://github.com/lsd-rs/lsd), [ripgrep](https://github.com/BurntSushi/ripgrep) and [fd](https://github.com/sharkdp/fd)

  ```
  cargo install lsd ripgrep fd-find
  ```

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

- Install [Lazygit](https://www.lazyvim.org)
- Config should automatically be loaded from the repo

## Version Managers

- You probably want to install version managers for the usual suspects: [nvm](https://github.com/nvm-sh/nvm), [gvm](https://github.com/moovweb/gvm), [uv](https://github.com/astral-sh/uv) and [pyenv](https://github.com/pyenv/pyenv)
