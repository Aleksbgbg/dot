() {
  function up-line-or-local-history() {
      zle set-local-history 1
      zle up-line-or-history
      zle set-local-history 0
  }
  zle -N up-line-or-local-history

  function down-line-or-local-history() {
      zle set-local-history 1
      zle down-line-or-history
      zle set-local-history 0
  }
  zle -N down-line-or-local-history

  up_key=${terminfo[kcuu1]}
  bindkey "${up_key}" up-line-or-local-history

  down_key=${terminfo[kcud1]}
  bindkey "${down_key}" down-line-or-local-history
}
