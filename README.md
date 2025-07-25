# What?

A repo to store all my config/dot files. Also contains instructions and some reasoning.
Mostly inspired by [this playlist](https://www.youtube.com/watch?v=o4X8GU7CCSU&list=PLnu5gT9QrFg36OehOdECFvxFFeMHhb_07&pp=iAQB).
If you've everything installed, cloning this in `$HOME` should be enough to get running.

# Why?

So that I can setup my devices easily.

# How?

I started with [regolith](https://regolith-linux.org/) based on [i3](https://i3wm.org/). Stopped using that when I shifted to Mac. Now I use [wezterm](https://wezfurlong.org/wezterm/) with [lazyvim](https://www.lazyvim.org) and [tmux](https://github.com/tmux/tmux/wiki).

## MacOS setup

- System Settings > Desktop and Dock >
  - Disable "Show recent applications in dock"
  - Enable "Automatically hide and show the Dock"
  - Disable "Automatically rearrange spaces based on most recent use"
- Install Karabiner to modify caps lock key like [this](https://dannyguo.medium.com/remap-caps-lock-to-escape-and-control-774576c135e6#:~:text=script%20on%20startup.-,Mac,-I%20use%20Karabiner).
  Press alone for escape and with other keys for control
- Install homebrew
  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```
- Install the font
  ```
  brew install --cask font-geist font-geist-mono font-geist-mono-nerd-font
  ```
- Clone this repo locally in `~/.config`. You might want to backup existing configs
  ```
  git clone https://github.com/oddgr8/.config.git ~/.config
  ```

## Terminal emulator setup

- Install and run [wezterm](https://wezfurlong.org/wezterm/)
- Config should automatically be loaded from the repo


## Shell setup

- Install [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) if not already present
- Set zsh as the default shell
  ```
  chsh -s $(which zsh)
  ```
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
  source $HOME/.config/zsh/.zshrc
  ```
- Install [tmux](https://github.com/tmux/tmux/wiki), [zsh](https://zsh.sourceforge.io), [make](https://www.gnu.org/software/make/manual/make.html), [pip](https://pypi.org/project/pip/) [curl](https://curl.se), [wget](https://www.gnu.org/software/wget/), [zoxide](https://github.com/ajeetdsouza/zoxide) and [fzf](https://junegunn.github.io/fzf/)
  ```
  brew install tmux make curl wget zoxide fzf# macos
  apt install build-essential tmux make curl wget zoxide fzf# ubuntu
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
- Make sure correct powerlevel10k config is picked by adding this to your `.zshenv`
  ```
  export POWERLEVEL9K_CONFIG_FILE=$HOME/.config/zsh/.p10k.zsh
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
- Install plugins mentioned in `.tmux.conf` automatically by pressing `Ctrl+A I` inside tmux

## Lazyvim

- Install all requirements of [Lazygit](https://www.lazyvim.org)
- Config should automatically be loaded from the repo
- Run `:LazyHealth` inside `nvim` to see if you want to add any more packages.

## Version Managers

- You probably want to install the following version managers for the usual suspects: [nvm](https://github.com/nvm-sh/nvm), [gvm](https://github.com/moovweb/gvm), [uv](https://github.com/astral-sh/uv)
