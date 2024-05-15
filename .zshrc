# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

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

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# CUSTOM SETTINGS
# -----------------

# BAT
export PATH="$PATH:/home/fsavoia/.cargo/bin/"
# export BAT_THEME=tokyonight_night
export BAT_THEME="Catppuccin Mocha"
alias cat='bat --style=plain --paging=never'

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
alias vim="/usr/share/nvim-linux64/bin/nvim"
alias vi="/usr/share/nvim-linux64/bin/nvim"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias zreload="source ~/.zshrc"
alias cls="clear"
alias cdvim="cd ~/.config/nvim"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# ls 
# alias ll='eza --long --sort=modified --git --icons'
alias l='eza --long --sort=modified --git --icons'
alias la='eza --long --sort=modified --git --icons --all'

# Python
alias pip=pip3
alias py=python3
alias python=python3

# Forescout SSH
alias eng="ssh -i ~/.ssh/id_rsa fsavoia@ein1-fsavoi-u20.fsd.forescout.com"
alias eng-api="sudo ssh -i /Users/fsavoia/.ssh/id_rsa -L 80:ein1-fsavoi-u20:5000 fsavoia@ein1-fsavoi-u20.fsd.forescout.com"
alias eng-docs="sudo ssh -i /Users/fsavoia/.ssh/id_rsa -L 80:ein1-fsavoi-u20:8000 fsavoia@ein1-fsavoi-u20.fsd.forescout.com"
alias eng-ssl="sudo ssh -i /Users/fsavoia/.ssh/id_rsa -L 443:ein1-fsavoi-u20:4443 fsavoia@ein1-fsavoi-u20.fsd.forescout.com"
alias client="cd otbu-upserv-client"
alias server="cd otbu-upserv-server"
alias cli="cd otbu-upserv-cli"
alias cicd="cd otbu-upserv-cicd"
alias fs="sudo /home/fsavoia/.pyenv/shims/forescout-edge-update"
# alias forescout-edge-update="sudo /home/fsavoia/.pyenv/shims/forescout-edge-update"
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


alias pipenv="/home/fsavoia/.pyenv/shims/pipenv"
