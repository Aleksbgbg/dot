# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/google/home/aleksbgbg/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/usr/local/google/home/aleksbgbg/.fzf/bin"
fi

eval "$(fzf --zsh)"
