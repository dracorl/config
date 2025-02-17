# History config
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY      # Her komutu hemen geçmişe ekler
setopt SHARE_HISTORY           # Geçmiş paylaşımını aktif eder, farklı oturumlar arası senkronizasyon
setopt HIST_SAVE_NO_DUPS       # Yeni komut geçmişi kaydedilirken tekrar eden girdileri kaydetmez
setopt APPEND_HISTORY          # Çoklu terminal oturumlarında geçmişe ekleme yapar
setopt EXTENDED_HISTORY        # Her komutun zaman bilgisi ile kaydedilmesini sağlar

# tmux config
precmd() {
  if [[ -n "$TMUX" ]]; then
    tmux refresh-client -S
  fi
}

# Prompt config
PS1=" "

bindkey '^[[1;5C' forward-word  # ctrl + right ile kelime ileri gitme
bindkey '^[[1;5D' backward-word # ctrl + left ile kelime geri gitme
bindkey '^H' backward-kill-word # ctrl + backspace ile kelime silme
bindkey '^[[3;5~' kill-word     # ctrl + delete ile kelime silme

# alias
alias ls='ls --color=auto'
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export TERM="xterm-256color"

export TMUX_CONFIG="$HOME/.config/tmux/tmux.conf"

# cargo
export PATH="$HOME/.cargo/bin:$PATH"
# yabridge
export PATH="$HOME/.local/bin/yabridge:$PATH"
# tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"
# local
export PATH="$HOME/.local/bin:$PATH"
# npm
export PATH="$PATH:$HOME/.npm-global/bin"
path_remove() {
    local arg path
    for arg in "$@"; do
        path=${PATH//:$arg:/:}
        path=${path/#$arg:/}
        path=${path/%:$arg/}
    done
    export PATH="$path"
}
export TERM=xterm-256color
#eval "$(starship init zsh)"

# nvim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
