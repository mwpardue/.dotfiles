zstyle ':completion:*' menu select=2
zstyle :omz:plugins:ssh-agent identities My\ Keys/Identity
zmodload zsh/complist

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/mpardue/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="aussiegeek"
#ZSH_THEME="juanghurtado"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(git zsh-autosuggestions zsh-syntax-highlighting ssh-agent vi-mode)

source $ZSH/oh-my-zsh.sh
ZSH_THEME_TERM_TITLE_IDLE=%~

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ezssh="ssh -F /Users/mpardue/.ssh/insecureconfig"
alias faxssh="ssh -F /Users/mpardue/.ssh/faxconfig"
alias ezscp="scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias ll="ls -la"
alias allssh="ssh -F /Users/mpardue/.ssh/allconfig"
alias qcorne="qmk compile -kb crkbd/rev1 -km caracarn"
alias qpreonic="qmk compile -kb preonic/rev3_drop -km caracarn"
alias qcornedfu="mv /Users/mpardue/git/qmk_firmware/crkbd_rev1_caracarn.hex /Users/mpardue/git/qmk_firmware/crkbd_rev1_caracarn_dfu.hex"
alias qcornecat="mv /Users/mpardue/git/qmk_firmware/crkbd_rev1_caracarn.hex /Users/mpardue/git/qmk_firmware/crkbd_rev1_caracarn_caterina.hex"
alias qcornec4="qmk clean; qmk compile -kb crkbd/rev1 -km caracarn -e CONVERT_TO=bonsai_c4"
alias qcornerp="qmk clean; qmk compile -kb crkbd/rev1 -km caracarn -e CONVERT_TO=helios"
alias qkyria="qmk clean; qmk compile -kb splitkb/kyria/rev3 -km coramoor -e CONVERT_TO=liatris"
alias screen="/usr/local/bin/screen"
alias vi="nvim"
alias nv="nvim"
alias colours="/Users/mpardue/Downloads/colors.sh | less"
alias tm="/Users/mpardue/Documents/scripts/tm.sh"
alias kssh="kitty +kitten ssh"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias ..='cd ..'
alias 2..='cd ../..'
alias 3..='cd ../../..'
alias ndiff='nvim -d -c "set foldlevel=9999 nornu"'
alias sshot='sshto'
alias hg='history | grep'
alias lsdev='ls /dev/cu*'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

MINICOM='--color=off -s -D /dev/cu.usbserial-113110 -b 9600'
export MINICOM

# Show remote host name in tmux pane
# ssh() {
#     if [ -n "$TMUX" ]; then
#         tmux -2u select-pane -T "$(echo $* | rev | cut -d '@' -f1 | rev)";
#         command ssh "$@"; tmux -2u select-pane -T "#{host}";
#         tmux -2u set-window-option automatic-rename "on" > /dev/null;
#     else
#         command ssh "$@";
#     fi
# }

#alias tssh="set SSHhost = $@ ; tmux set-window-option automatic-rename ; tmux select-pane -T $SSHhost ; ssh "

# Keypad
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

# Use vi navigation in zsh menu select
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Enable vi mode
bindkey -v

. /usr/local/opt/asdf/libexec/asdf.sh
# . $(brew --prefix asdf)/asdf.sh
# export PATH="/usr/local/opt/openssl@3/bin:$PATH:/Library/Frameworks/Python.framework/Versions/3.11/bin"
 export PATH="/usr/local/opt/openssl@3/bin:$PATH:/Library/Frameworks/Python.framework/Versions/3.11/bin:/usr/local/opt/gnu-sed/libexec/gnubin:$PATH:/usr/local/opt/inetutils/libexec/gnubin:/Applications/CMake.app/Contents/bin:/Users/mpardue/Downloads/ext4fuse/ext4fuse:$PATH"
#export PATH="/usr/local/opt/openssl@3/bin:/Library/Frameworks/Python.framework/Versions/3.11/bin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/inetutils/libexec/gnubin:$PATH"
export KERL_CONFIGURE_OPTIONS="--without-javac --with-ssl=$(brew --prefix openssl@1.1)"

eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --exclude /Users/mpardue/Library/'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# neofetch
