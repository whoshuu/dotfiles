# Setup fzf
# ---------
if [[ ! "$PATH" == */home/huu/.fzf/bin* ]]; then
  export PATH="$PATH:/home/huu/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/huu/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/huu/.fzf/shell/key-bindings.bash"

