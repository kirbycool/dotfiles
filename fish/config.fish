fish_vi_key_bindings
bind -M insert \cf end-of-line

set -gx EDITOR nvim
set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden'
set -gx PATH $HOME/.vim/plugged/fzf/bin $PATH

set -gx GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

set -gx PATH $HOME/.cargo/bin $PATH

set -gx ASDF_ROOT ~/.asdf
source ~/.asdf/asdf.fish

alias be='bundle exec'
alias ls='exa'
alias tmux='tmux -2'
alias tf='terraform'

eval (starship init fish)

# Machine specific settings
if test -e local.fish
  source local.fish
end
