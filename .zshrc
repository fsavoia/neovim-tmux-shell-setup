# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Custom Settings

# BAT
export PATH="$PATH:/home/fsavoia/.cargo/bin/"
# export BAT_THEME=tokyonight_night
export BAT_THEME="Catppuccin Mocha"
alias cat='bat --style=plain,changes --paging=never'

# FZF
# Use ( as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='&'

export PATH="$PATH:/home/fsavoia/.fzf/bin/"
alias f="fzf"

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan} --height 60% --border"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}

eval "$(fzf --zsh)"

# Terminal
alias vi="nvim"
alias v="nvim"
alias vim="nvim"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias zr="source ~/.zshrc"
alias cls="clear"
alias c="clear"
alias cdv="cd ~/.config/nvim"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# ls 
# alias ll='eza --long --sort=modified --git --icons'
alias l='eza --long --sort=modified --git --icons'
alias la='eza --long --sort=modified --git --icons --all'

# Python
alias pip=pip3
alias py=python3
alias python=python3
alias pipenv="/home/fsavoia/.pyenv/shims/pipenv"

# Forescout
alias eng="ssh -i ~/.ssh/id_rsa fsavoia@ein1-fsavoi-u20.fsd.forescout.com"
alias eng-api="sudo ssh -i /Users/fsavoia/.ssh/id_rsa -L 80:ein1-fsavoi-u20:5000 fsavoia@ein1-fsavoi-u20.fsd.forescout.com"
alias eng-docs="sudo ssh -i /Users/fsavoia/.ssh/id_rsa -L 80:ein1-fsavoi-u20:8000 fsavoia@ein1-fsavoi-u20.fsd.forescout.com"
alias eng-ssl="sudo ssh -i /Users/fsavoia/.ssh/id_rsa -L 443:ein1-fsavoi-u20:4443 fsavoia@ein1-fsavoi-u20.fsd.forescout.com"
alias client="cd && cd otbu-upserv-client"
alias server="cd && cd otbu-upserv-server"
alias cli="cd && cd otbu-upserv-cli"
alias cicd="cd && cd otbu-upserv-cicd"
alias fs="sudo /home/fsavoia/.pyenv/shims/forescout-edge-update"
export PATH="$PATH:/home/fsavoia/.pyenv/shims/"

# GIT
alias gs="git switch"
alias s="git status -s"
alias lz="lazygit"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

export NODE_TLS_REJECT_UNAUTHORIZED=0

# TMUX
alias ta="tmux attach -t"
alias tl="tmux ls"
alias td="tmux detach"
alias tk="tmux kill-session -t"
alias tn="tmux new-session -s"

# Enabling Pyenv
export PYENV_ROOT="$HOME"/.pyenv
export PATH="$PYENV_ROOT"/bin:"$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"

# G
export PATH=$PATH:/usr/local/go/bin
