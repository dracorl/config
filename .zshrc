# History config
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY      # Her komutu hemen geçmişe ekler
setopt SHARE_HISTORY           # Geçmiş paylaşımını aktif eder, farklı oturumlar arası senkronizasyon
setopt HIST_SAVE_NO_DUPS       # Yeni komut geçmişi kaydedilirken tekrar eden girdileri kaydetmez
setopt APPEND_HISTORY          # Çoklu terminal oturumlarında geçmişe ekleme yapar
setopt EXTENDED_HISTORY        # Her komutun zaman bilgisi ile kaydedilmesini sağlar

# tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"

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
eval "$(starship init zsh)"
