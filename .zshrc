# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH='/home/august/.oh-my-zsh'

# ZSH_THEME='lambda-gitster'
ZSH_THEME=''

source $ZSH/oh-my-zsh.sh

# ---

# Aliases
alias pac='sudo pacman'
alias pacs='sudo pacman -S'
alias pacu='garuda-update'
alias pacq='sudo pacman -Ss'
alias pacr='sudo pacman -R'
alias yays='yay -S'
alias yayu='yay -Syu'
alias yayq='yay -Ss'
alias yayr='yay -R'

alias vi='nvim'
alias svi='sudo nvim'

alias top='bpytop'
alias nf='neofetch'
alias pwf='sudo pywalfox'

alias szsh='source ~/.zshrc'
alias stmux='tmux source ~/.tmux.conf'

alias at='alacritty-themes'

alias sys='sudo systemctl'
alias sysu='systemctl --user'

function git_clone() { git clone https://beebeau-chimmy:$(cat ~/.secrets/git_repo_access.key)@github.com/beebeau-chimmy/$1 ~/repos/$1; }

function walgen() {
    echo 'Generating new Pywal colors...'
    wal -i "~/Pictures/wallpapers/$1"

    echo 'Pushing new colors to Polybar...'
    ~/.config/polybar/colorblocks/scripts/pywal.sh ~/Pictures/wallpapers/$1

    # Restart dunst with pywal colors
    ~/.config/dunst/wal_dunst.sh

    # # Discord
    # pywal-discord
}
alias wg=walgen

alias nps='wine ~/.config/nps/nps.exe'

## Navigation

# non-eza
# alias l='ls -arX1'
# alias ls='ls -arX -I "." -I ".." --si'
# alias ll='ls -larX --si'
# alias lld='ls -larRX --si'

### For colorls
alias l='eza -arX1 --icons --color=always --group-directories-first'
alias ls='eza -arX -I "." -I ".." --icons --color=always --group-directories-first'
alias ll='eza -larX --icons --color=always --group-directories-first'
alias lld='eza -larRX --icons --color=always --group-directories-first'
alias lt='eza -T --icons --color=always --group-directories-first'

# alias rmt='mv $1 ~/.local/share/Trash'

alias ..='cd ..'
alias home='cd'

## Configs
alias zshconf='vi ~/.zshrc'
alias alaconf='vi ~/.config/alacritty/alacritty.toml'
alias csconf='vi /run/media/august/games/SteamLibrary/steamapps/common/Counter-Strike\ Global\ Offensive/csgo/cfg/autoexec.cfg'
alias tconf='vi ~/.tmux.conf'
alias packerconf='vi ~/.config/nvim/lua/august/packer.lua'
alias lspconf='vi ~/.config/nvim/after/plugin/lsp-zero.lua'
alias wmconf='vi ~/.config/i3/config'

## Folders
alias nvim_folder='cd ~/.config/nvim'
alias tmux_folder='cd ~/.tmux'
alias i3_folder='cd ~/.config/i3'

# ---

# Exports

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# ---

# Configuration

# ================================= #
## ZPlug - better zsh plugin manager

source ~/.zplug/init.zsh
zplug "marlonrichert/zsh-autocomplete"
zplug "zsh-users/zsh-autosuggestions"
zplug "hlissner/zsh-autopair"

# oh-my-zsh plugins
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/httpie", from:oh-my-zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2

### Theme
zplug "geometry-zsh/geometry", as:theme

## Checks if all plugins are installed
if ! zplug check; then
    zplug install
fi

# ================================= #

# source plugins and add commands to the PATH
zplug load

# bun completions
[ -s "/home/august/.bun/_bun" ] && source "/home/august/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Turso
export PATH="/home/august/.turso:$PATH"

# Persist Pywal colorgen
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
# cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
