() {
  function vi-up-line-or-local-history() {
      zle set-local-history 1
      zle vi-up-line-or-history
      zle set-local-history 0
  }
  zle -N vi-up-line-or-local-history

  function vi-down-line-or-local-history() {
      zle set-local-history 1
      zle vi-down-line-or-history
      zle set-local-history 0
  }
  zle -N vi-down-line-or-local-history

  down_key=${terminfo[kcud1]}
  bindkey -M viins "${down_key}" vi-down-line-or-local-history

  up_key=${terminfo[kcuu1]}
  bindkey -M viins "${up_key}" vi-up-line-or-local-history
}

bindkey -M vicmd j vi-backward-char
bindkey -M vicmd k vi-down-line-or-local-history
bindkey -M vicmd l vi-up-line-or-local-history
bindkey -M vicmd \; vi-forward-char

bindkey -M visual j vi-backward-char
bindkey -M visual k down-line
bindkey -M visual l up-line
bindkey -M visual \; vi-forward-char
