set -gx LC_ALL en_US.UTF-8

if status is-interactive
    # Commands to run in interactive sessions can go here
end

bind \cB backward-word

# alias vi "nvim"
alias vi='nvim'

# Git aliases
alias G "git"
