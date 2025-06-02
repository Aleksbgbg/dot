# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/google/home/aleksbgbg/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/usr/local/google/home/aleksbgbg/.fzf/bin"
fi

source <(fzf --zsh | sed '/history\[@\]/s/^/fc -RI; /')
