set -gx LC_ALL en_US.UTF-8

if status is-interactive
    # Commands to run in interactive sessions can go here
end

bind \cB backward-word
bind \co edit_command_buffer

# alias vi "nvim"
alias vi='nvim'

# Git aliases
alias G "git"
alias co "git checkout"
alias vb "git branch"
alias vp "git pull"
alias vP "git push"
alias vs "git status"
