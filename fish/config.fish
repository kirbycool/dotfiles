fish_vi_key_bindings
bind -M insert \cf end-of-line

set -gx EDITOR nvim
set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden'
fish_add_path $HOME/.vim/plugged/fzf/bin

set -gx GOPATH $HOME/go
fish_add_path $GOPATH/bin

fish_add_path $HOME/.cargo/bin

# Random local binaries
fish_add_path $HOME/.local/bin

alias be='bundle exec'
alias tmux='tmux -2'
alias tf='terraform'
alias rg='rg --hidden'

# Machine specific settings
if test -e ~/.config/fish/local.fish
  source ~/.config/fish/local.fish
end

eval (starship init fish)

zoxide init fish | source
mise activate fish | source
