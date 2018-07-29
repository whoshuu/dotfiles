###################################################################################################
#                                                                                                 #
#                                       zshrc configuration                                       #
#                                                                                                 #
###################################################################################################

### Table of contents ###
#                       #
#  [MSC] Misc           #
#  [HST] History        #
#  [CLR] Colors         #
#  [PMT] Prompt         #
#  [VIM] Vim mode       #
#  [CMP] Completions    #
#  [SRC] Extra sources  #
#  [PLG] Plugins        #
#                       #
#########################

## [MSC] Misc ##
unsetopt beep
bindkey -v
zstyle :compinstall filename '~/.zshrc'
autoload -U colors && colors
autoload -Uz compinit
compinit
bindkey "^R" history-incremental-search-backward
bindkey "^F" history-incremental-search-forward

## [HST] History ##
HISTFILE=~/.zsh/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt APPEND_HISTORY # Don't erase history
setopt EXTENDED_HISTORY # Add additional data to history like timestamp
setopt INC_APPEND_HISTORY # Add immediately
setopt HIST_FIND_NO_DUPS # Don't show duplicates in search
setopt HIST_IGNORE_SPACE # Don't preserve spaces
setopt NO_HIST_BEEP # Don't beep
setopt SHARE_HISTORY # Share history between sessions

## [CLR] Colors ##
export TERM='rxvt-unicode'
export COLORTERM='rxvt-unicode-256color'
[ -n "$TMUX" ] && export TERM=screen-256color
if type gdircolors > /dev/null; then
    eval `gdircolors ~/.dircolors.256dark`
else
    eval `dircolors ~/.dircolors.256dark`
fi
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
export LS_COLORS
export CLICOLOR=1

## [PMT] Prompt ##
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr 'S'
zstyle ':vcs_info:*' actionformats '%F{1}[%b | %a]%f '
zstyle ':vcs_info:*' formats \
      '%F{2}%i[%b] %F{3}%c%F{1}%u%S%f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' enable git
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]]; then
    if git diff-index --quiet HEAD &> /dev/null; then
      # One more corner case here where the repo isn't set up correctly
      hook_com[revision]=''
      hook_com[subdir]=''
    else
      hook_com[revision]='%F{1}'
      hook_com[subdir]=' '
    fi
    if [[ $(git ls-files --other --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]]; then
      hook_com[unstaged]+='%F{1}??%f'
      hook_com[subdir]=' '
    fi
  fi
}
precmd () { vcs_info }
# [user@host] directory [branch] %
PROMPT='%F{3}[%n@%m] %F{4}%3~ ${vcs_info_msg_0_}%f%# '

## [VIM] Vim mode ##
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% edit]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$EPS1"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
bindkey -M vicmd '\e' vi-insert

## [CMP] Completions ##
zstyle ':completion:*:*:git:*' ignored-patterns 'check-*' 'checkout-*'
REPORTTIME=30

[[ -z $(ps aux | grep gpg-agent | grep -v grep) ]] && eval $(gpg-agent --daemon)

## [SRC] Extra sources ##
[ -f ~/.exports.default ] && source ~/.exports.default
[ -f ~/.aliases.default ] && source ~/.aliases.default
[ -f ~/.exports ] && source ~/.exports
[ -f ~/.aliases ] && source ~/.aliases

## [PLG] Plugins ##
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # Fuzzy history and file search
[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh && bindkey '^ ' autosuggest-accept # Suggested completions for the prompt
[[ -z "$TMUX" && -f ~/.config/misc/pokemon ]] && tmux -2 new -s "$(shuf -n 1 ~/.config/misc/pokemon)" # Random naming of tmux sessions
