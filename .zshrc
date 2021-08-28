export ZSH="/home/athul/.oh-my-zsh"
export FZF_BASE="/usr/share/fzf"

ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git autojump vi-mode fzf zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export TERM='xterm'
else
  export EDITOR='nvim'
fi

#Compilation flags
export ARCHFLAGS="-arch x86_64"
export MAKEFLAGS='-j4'

alias in="sudo pacman -S"
alias re="sudo pacman -R"
alias update="sudo pacman -Syu --noconfirm"
alias tmux="tmux -2"
alias search="pacman -Slq | fzf -m --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias yays="yay -Slq | fzf -m --preview 'yay -Si {1}'| xargs -ro yay -S"
alias ip="ip -c -h -br"
alias open="xdg-open"
alias vim=/usr/bin/nvim
alias man3="man 3"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias tlmgr="/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode"
alias p=evince
alias fcopy="xclip -sel c <"
alias h=devour
alias usb="udisksctl mount -b"
alias usbr="udisksctl unmount -b"
alias ":q"=exit
alias mkcd=". /home/athul/bin/mkcd"
alias mv="mv -i"
alias sctl="sudo systemctl"
alias vimconfig="nvim ~/.config/nvim/init.vim"
alias start="sudo systemctl start"
alias stop="sudo systemctl stop"
alias status="sudo systemctl status"
alias tmux="TERM=screen-256color-bce tmux"
alias wgup="sudo wg-quick up wg0"
alias wgdown="sudo wg-quick down wg0"

path+=~/.local/bin

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
export EDITOR=nvim
export WINEPREFIX=~/.wine
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/bin:/home/athul/.gem/ruby/3.0.0/bin:$PATH"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export LFS=/home/athul/lfs
export LS_COLORS="$LS_COLORS:ow=103;30;01"
export PATH=$PATH:/home/athul/bin

