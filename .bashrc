# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
#
#
#
#
#
#
# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'

# . "$HOME/.local/share/../bin/env"

export NNN_TMPFILE="$HOME/.config/nnn/.lastd"

f() {
  nnn "$@"

  if [ -f "$NNN_TMPFILE" ]; then
    . "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE"
  fi
}

alias vpn="adguardvpn-cli connect --location=Oslo --verbose"
alias vpnd="adguardvpn-cli disconnect"
alias vpns="adguardvpn-cli status"


export PATH="$HOME/.local/bin:$PATH"


# set VPN connection
# adguardvpn-cli connect --location=Oslo --verbose


# !! Contents within this block are managed by juliaup !!


n () {
    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE"
    fi
}


alias cr="cargo run"
alias cl="clear"
# alias c="g++


export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME

alias clion="GDK_SCALE=1 GDK_DPI_SCALE=1 clion"
alias webstorm="GDK_SCALE=1 GDK_DPI_SCALE=1 webstorm"
alias android-studio="GDK_SCALE=1 GDK_DPI_SCALE=1 android-studio"

alias _='code .'

# Disable it so the "!" alias works:
# set +H 2>/dev/null  true          # bash
# unsetopt BANG_HIST 2>/dev/null  true  # zsh

# helper functions
__clone_cd() {
  local url="$1"
  [ -z "$url" ] && { echo "usage: ! <git-url>"; return 2; }
  git clone "$url"  return $?
  cd "$(basename "$url" .git)"  return $?
}

__clone_cd_code() {
  local url="$1"
  [ -z "$url" ] && { echo "usage: @ <git-url>"; return 2; }
  __clone_cd "$url" || return $?
  code .
}

alias \!='__clone_cd'

alias @='__clone_cd_code'


alias unpack='(){ mv "$1"/* . && rm -rf "$1"; }'
alias mkd='(){mkdir "$1";cd "$1";}'
alias mk='mkdir'

alias duh='(){ du -h --max-depth=1 .;}'

alias cl='clear'
alias df='df -h /'

alias tar='tar -zxvf'
alias th='touch'
alias ca='cat'
alias lr='ls -tra'

alias off="shutdown now"
alias d='cd /home/x/c'
alias c="cd"
alias reb='reboot'

alias nf='neofetch'

alias b="nvim ~/.bashrc"
alias ch="nvim ~/.config/hypr"
alias dh="nvim ~/.local/share/omarchy/default/hypr"

alias slp="systemctl suspend"
alias off="shutdown now"
alias reb="reboot"

alias vim="nvim"
alias v="nvim"

alias cam="guvcview"
alias zip="zip -r"

alias l="ls -la"
alias m="mv"

alias sleep_history="journalctl -u systemd-suspend.service --since today"

kon() {
  for led in kbd_backlight lid_logo_dot power standby thinklight thinkvantage; do
    echo 0 | sudo tee /sys/class/leds/tpacpi::$led/brightness > /dev/null
  done
  echo 0 | sudo tee /sys/class/leds/platform::micmute/brightness > /dev/null
  echo 0 | sudo tee /sys/class/leds/platform::mute/brightness > /dev/null
  echo 1 | sudo tee /sys/class/leds/tpacpi::kbd_backlight/brightness > /dev/null
}

koff() {
  for led in kbd_backlight lid_logo_dot power standby thinklight thinkvantage; do
    echo 0 | sudo tee /sys/class/leds/tpacpi::$led/brightness > /dev/null
  done
  echo 0 | sudo tee /sys/class/leds/platform::micmute/brightness > /dev/null
  echo 0 | sudo tee /sys/class/leds/platform::mute/brightness > /dev/null
  echo 0 | sudo tee /sys/class/leds/tpacpi::kbd_backlight/brightness > /dev/null
}

camoff() { sudo modprobe -r uvcvideo; }
camon() { sudo modprobe uvcvideo; }
