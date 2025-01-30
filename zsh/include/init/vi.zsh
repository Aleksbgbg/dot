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
}

bindkey -M vicmd j vi-backward-char
bindkey -M vicmd k vi-down-line-or-local-history
bindkey -M vicmd l vi-up-line-or-local-history
bindkey -M vicmd \; vi-forward-char
bindkey -M vicmd "^[[A" vi-up-line-or-local-history
bindkey -M vicmd "^[[B" vi-down-line-or-local-history

bindkey -M viins "^[[A" vi-up-line-or-local-history
bindkey -M viins "^[[B" vi-down-line-or-local-history

bindkey -M visual j vi-backward-char
bindkey -M visual k down-line
bindkey -M visual l up-line
bindkey -M visual \; vi-forward-char
