# LC/LANG: https://www.gnu.org/software/libc/manual/html_node/Locale-Categories.html
# System avail: `locale -a`
export LANG=en_US.UTF-8
export LC_COLLATE=no_NO.UTF-8
export LC_CTYPE=no_NO.UTF-8

# General
setopt correctall # autocorrect commands
setopt no_beep

alias ssh='TERM=xterm-256color ssh'
alias l='ls -lh'   # size,show type,human readable
alias lr='ls -tRh' # sorted by date,recursive,show type,human readable
alias la='ls -a'   # list all
alias lt='ls -lth' # long list,sorted by date,show type,human readable
alias ll='ls -lFh' # long list
alias grep='grep --color'

# git:
alias gs='git status'

# ls colors
if [[ -x "`whence -p dircolors`" ]]; then
  eval `dircolors`
  alias ls='ls -F --color=auto'
elif [[ `uname` == 'Darwin' ]]; then
  alias ls='ls -G'
else
  alias ls='ls -F'
fi

# Keybindings
bindkey ' ' magic-space # [Space] - do history expansion
bindkey -e              # use emacs key style
# ...with some vi like keys bindings:
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char # [Ctrl-h] - delete backwards char
bindkey '^w' backward-delete-word # [Ctrl-w] - delete word backward
bindkey '^q' kill-whole-line      # [Ctrl-q] - delete whole line
bindkey '^d' kill-whole-line      # [Ctrl-d] - delete whole line
bindkey '^b' backward-word        # [Ctrl-b] - move back a word
bindkey '^r' history-incremental-search-backward
bindkey '^p' up-line-or-search    # start typing + [Ctrl-p] - fuzzy find history forward
bindkey '^n' down-line-or-search  # start typing + [Ctrl-n] - fuzzy find history backward
# edit the current command line in $EDITOR:
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# Completion
autoload -Uz compinit && compinit -i; compinit # load/init completion, ignoring insecure directories
bindkey '^[[Z' reverse-menu-complete           # shift-tab to go back in completion menu
unsetopt flow_control                          # delete line/word works when completion menu is open
setopt complete_in_word
setopt complete_aliases
setopt always_to_end                           # move cursor to end if one match
setopt path_dirs                               # path search
setopt auto_param_slash                        # if completed parameter is dir, add trailing slash
setopt auto_menu                               # automatically use menu completion
setopt always_last_prompt                      # return cursor to line last edited after printing completion list
setopt menu_complete                           # unix.stackexchange.com/questions/185537/combining-zsh-s-tab-completion-with-case-insensitivity
setopt no_list_ambiguous
zstyle ':completion:*' menu yes select         # show active element
# case insensitive completion scriptingosx.com/2019/07/moving-to-zsh-part-5-completions :
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 

# Globbing
setopt NO_CASE_GLOB      # case insensitive globbing
setopt EXTENDED_GLOB     # powerful zsh globbing features, see refining-linux.org/archives/37/ZSH-Gem-2-Extended-globbing-and-expansion
setopt NUMERIC_GLOB_SORT # numerically sort number globs

# History
HISTFILE=~/.zsh_history
HISTSIZE=SAVEHIST=8000
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplications
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history    # share command history data

# Term in app mode when zle (only then values from $terminfo are valid):
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# Promt
setopt PROMPT_SUBST
PROMPT='
%{%F{green}%}%9c$(parse_git_branch)
%{%F{blue}%}%# %{%F{none}%}'
parse_git_branch() {
    git_status="$(git status 2> /dev/null)"
    pattern="On branch ([^[:space:]]*)"
    if [[ ! ${git_status} =~ "(working (tree|directory) clean)" ]]; then
        state="*"
    fi
    if [[ ${git_status} =~ ${pattern} ]]; then
      branch=${match[1]}
      branch_cut=${branch:0:35}
      if (( ${#branch} > ${#branch_cut} )); then
          echo " (${branch_cut}…${state})"
      else
          echo " (${branch}${state})"
      fi
    fi
}

# (Neo)vim
export EDITOR="nvim"


# OS/scripts specifics
# --------------------

# Paths
export PATH=$HOME/bin:/usr/local/bin:/local/bin:$PATH

# Macos
alias update='brew update && brew upgrade'

# fzf -- github.com/junegunn/fzf
export PATH=$HOME/.fzf/bin:$PATH

# added by fzf mac install:
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias activate="source \$HOME/.venv/\$(basename \"\$PWD\")/bin/activate"
