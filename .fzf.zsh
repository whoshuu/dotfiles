# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Setup fzf
# ---------
if [[ ! "$PATH" == */home/huu/.fzf/bin* ]]; then
  export PATH="$PATH:/home/huu/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/huu/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/huu/.fzf/shell/key-bindings.zsh"

