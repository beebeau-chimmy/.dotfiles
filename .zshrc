# If you come from bash you might have to change your $PATH.
export BROWSER=microsoft-edge-stable
export TERMINAL=/usr/bin/alacritty
# ---

# Aliases
alias s='sudo'
alias pac='sudo pacman'
alias pacs='sudo pacman -Sy --needed'
alias pacu='sudo pacman -Syu --needed'
alias pacq='sudo pacman -Ss'
alias pacr='sudo pacman -R'
alias yays='yay -Sy --needed'
alias yayu='yay -Syu --needed'
alias yayq='yay -Ss'
alias yayr='yay -R'

alias vi='nvim'
alias svi='sudo nvim'

alias top='bpytop'
alias nf='neofetch'
alias sz='7z'

alias szsh='source ~/.zshrc'
alias stmux='tmux source ~/.tmux.conf'

alias at='alacritty-themes'
alias rofi_style="function rofistyle() {vi ~/.config/rofi/launchers/type-$1/launcher.sh} rofistyle"
alias rofi_color="function roficolor() {vi ~/.config/rofi/launchers/type-$1/shared/colors.rasi} roficolor"
alias list_iommu="sh ~/.config/i3/scripts/list_iommu.sh"
alias gpu="sudo ~/.config/i3/scripts/hows_my_gpu"
alias gpu_enable="sudo /etc/libvirt/hooks/gpu_linux"
alias gpu_disable="sudo /etc/libvirt/hooks/gpu_vm"
alias check_res="xrandr | rg -i -U -P '(?<=DisplayPort-0)(?s)(.*)[A-Z\-]+-[0-9]+' | rg -o '[0-9]+x[0-9]+'"

alias sys='sudo systemctl'
alias sysu='systemctl --user'

function git_clone() { git clone https://beebeau-chimmy:$(cat ~/.secrets/git_repo_access.key)@github.com/beebeau-chimmy/$1 ~/repos/$1; }

function walgen() {
	if [[ $1 == "-j" ]]; then
		picture="$2.jpg"
	elif [[ $1 == "-p" ]]; then
		picture="$2.png"
    elif [[ $1 == "" ]]; then
        picture=""
	else
		picture="$1.jpg"
	fi

	# Pywal
	echo 'Generating new Pywal colors...'
	wal -i "~/Pictures/wallpapers/$picture"

	# Polybar
	echo 'Pushing new colors to Polybar...'
	~/.config/polybar/colorblocks/scripts/pywal.sh ~/Pictures/wallpapers/$picture

	# Restart dunst with pywal colors
	~/.config/dunst/wal_dunst.sh

	# Nitrogen
	# nitrogen --head=0 --set-zoom-fill ~/Pictures/wallpapers/$picture
	# nitrogen --head=1 --set-zoom-fill ~/Pictures/wallpapers/$picture
}
alias wg=walgen
alias wallpapers='ls ~/Pictures/wallpapers'

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

### For colorls
alias ff='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse| xargs nvim'

# alias rmt='mv $1 ~/.local/share/Trash'
alias c='clear'
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
alias hyprconf='vi ~/.config/hypr/hyprland.conf'
alias piconf='vi ~/.config/picom/picom.conf'

## Folders
alias nvim_folder='cd ~/.config/nvim'
alias nvim_plugins='cd ~/.config/nvim/lua/august/plugins'
alias nvim_core='cd ~/.config/nvim/lua/august/core'
alias tmux_folder='cd ~/.tmux'
alias i3_folder='cd ~/.config/i3'
alias wm_folder='cd ~/.config/hypr'

# ---

# Exports

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='nvim'
else
	export EDITOR='nvim'
fi

# Add Custom Resolutions to ultrawide monitor
res_checks=('2560x1440') # Custom Resolutions to check
for resolution in $res_checks; do
    if [[ $(xrandr | rg -i -U -P '(?<=DisplayPort-0)(?s)(.*)[A-Z\-]+-[0-9]+' | rg -o  '[0-9]+x[0-9]+') != *$resolution* ]]; then
        xrandr --newmode "${resolution}_160.00"  907.25  2560 2792 3072 3584  1440 1443 1448 1583 -hsync +vsync
        xrandr --addmode DisplayPort-0 "${resolution}_160.00"
    fi
done
# for resolution in $res_checks; do
#     if [[ $(xrandr | rg -i -U -P '(?<=DisplayPort-0)(?s)(.*)[A-Z\-]+-[0-9]+' | rg -o  '[0-9]+x[0-9]+') != *$resolution* ]]; then
#         res_width=$(echo $resolution | rg -P -o '\d+(?=x)')
#         res_height=$(echo $resolution | rg -P -o '(?<=x)\d+')
#         newmode=$(cvt $res_width $res_height 160 | rg -P -o '(?<=Modeline ).*')
#         xrandr --newmode "${newmode}"
#         xrandr --addmode DisplayPort-0 "${resolution}_160.00"
#     fi
# done

# Enable "Full Aspect" display scaling for xorg displays
for output in $(xrandr --prop | grep -E -o -i "^[A-Z\-]+-[0-9]+"); do
    xrandr --output "$output" --set "scaling mode" "Full aspect";
done

# ---
# Configuration

# HISTORY
bindkey -e
bindkey '^k' history-search-backward
bindkey '^j' history-search-backward

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space

# Shell Integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Completion Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -arX -I "." -I ".." --icons --color=always --group-directories-first $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -arX -I "." -I ".." --icons --color=always --group-directories-first $realpath'

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
	print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
	command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
	command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
		print -P "%F{33} %F{34}Installation successful.%f%b" || \
		print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
	zdharma-continuum/zinit-annex-as-monitor \
	zdharma-continuum/zinit-annex-bin-gem-node \
	zdharma-continuum/zinit-annex-patch-dl \
	zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

### Theme
zinit ice as"theme"
zinit light geometry-zsh/geometry

zinit wait lucid light-mode for \
	atinit"zicompinit; zicdreplay" \
		zdharma-continuum/fast-syntax-highlighting \
	atload"_zsh_autosuggest_start" \
		zsh-users/zsh-autosuggestions \
	blockf atpull'zinit creinstall -q .' \
		zsh-users/zsh-completions

zinit load zdharma-continuum/history-search-multi-word
zinit light hlissner/zsh-autopair
zinit light Aloxaf/fzf-tab

autoload -U compinit && compinit
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit cdreplay -q
### End of Zinit's installer chunk

# bun completions
[ -s "/home/august/.bun/_bun" ] && source "/home/august/.bun/_bun"

# Use neovim to open man pages
if [ -e /usr/bin/nvimpager ]; then
	export PAGER=nvimpager
else
	sudo pacman -Syq --noconfirm --needed yay
	yay -Syq --noconfirm --needed nvimpager
	export PAGER=nvimpager
fi
# Persist Pywal colorgen
(cat ~/.cache/wal/sequences &)

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
