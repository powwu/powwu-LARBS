HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
PROMPT='%m%F{green}%B%(?.%#.%F{red}!)%b '
RPROMPT=' %F{red}%=%(?..%?)'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# PATH
PATH="$HOME/go/bin/:$HOME/.local/bin/:$HOME/.cargo/bin/:/root/cargo/bin/:$HOME/Wallpapers/bin/:$HOME/.yarn/bin/:$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"

# Aliases
alias hhkbmode='xmodmap -e "keycode 22 = grave" && xmodmap -e "keycode 49 = BackSpace"'
alias osumaps='mv ~/Downloads/*.osz ~/Games/osu/drive_c/osu/Songs/'
alias ovpn='sudo openvpn --config ~/owopenvpn-3.ovpn'
alias pvpn='nmcli con up "furry milking center" passwd-file ~/.vpn-password'
alias waifu2x=waifu2x-ncnn-vulkan
alias vc-enable="mv ~/.config/discord/* ~/.config/discord-temp/"
alias vc-disable="mv ~/.config/discord-temp/* ~/.config/discord/"
alias vc-clear="rm -rf ~/.config/discord-temp/*"
alias please='sudo $(fc -ln -1)'
alias brightness='xrandr --output eDP-1 --brightness'
alias rotate='xrandr --output DVI-D-0 --rotate'
alias refresh='pkill i3'
alias upload='curl bashupload.com -T'
alias vial=Vial
alias mic="pkill pulseaudio-equalizer && noisetorch -u && noisetorch -i"
alias ew="emacs -nw"
alias nano="echo 'no' && null"
alias telegram="$HOME/.local/share/Telegram"
alias discord="electron16 /usr/lib/discord/app.asar --no-sandbox"
alias white="feh --bg-fill ~/Wallpapers/white.png"
alias es="setxkbmap es"
alias us="setxkbmap us"
alias df="df -h"
alias du="du -h"
alias cls="clear"
alias neo="neofetch"
alias mkdir="mkdir -p"
alias cp="cp -r"
alias vim=nvim
alias snp='zsh -c "cd $HOME/.snippets && find . -type f -not -name \".*\" | gum filter | xargs cat; exit"'
alias snippet='zsh -c "cd $HOME/.snippets && find . -type f -not -name \".*\" | gum filter | xargs cat; exit"'
alias less=moar
alias update='sudo pacman -Sy --noconfirm && sudo powerpill -Su --noconfirm && yay -Su --noconfirm'
#alias sudo=doas

copy() {
	echo "$1" | xclip -selection c
}

git-fast() {
	git add . && git commit -m "$1" && git push
}

ls() {
	echo "$(pwd)/$1"; echo "$1" | xargs ls -lhAG --time-style=+'' --color=always | sed -re 's/^[drlwxt-]{10}\s+[^ ]*\s//' | sed -re '/^.*~undo-tree~.*$/d' 
	undotrees=$(/bin/ls -a $1 | grep "~undo-tree~" | wc -l);
	echo "$undotrees undo trees present" 
}

lsblk() {
	/usr/bin/lsblk | sed -re '/.*snapd.*/d' 
	snaploops=$(/bin/lsblk | grep "snapd" | wc -l);
	echo "$snaploops snap loops present" 
}

fast() {
	mkfifo /tmp/fast.com.test.fifo ;token=$(curl -s https://fast.com/app-ed402d.js|egrep -om1 'token:"[^"]+'|cut -f2 -d'"'); curl -s "https://api.fast.com/netflix/speedtest?https=true&token=$token" |egrep -o 'https[^"]+'|while read url; do first=${url/speedtest/speedtest\/range\/0-2048}; next=${url/speedtest/speedtest\/range\/0-26214400};(curl -s -H 'Referer: https://fast.com/' -H 'Origin: https://fast.com' "$first" > /tmp/fast.com.test.fifo; for i in {1..10}; do curl -s -H 'Referer: https://fast.com/' -H 'Origin: https://fast.com'  "$next">>/tmp/fast.com.test.fifo; done)& done & pv /tmp/fast.com.test.fifo > /dev/null; rm /tmp/fast.com.test.fifo
}

fuck () {
		TF_PYTHONIOENCODING=$PYTHONIOENCODING;
		export TF_SHELL=zsh;
		export TF_ALIAS=fuck;
		TF_SHELL_ALIASES=$(alias);
		export TF_SHELL_ALIASES;
		TF_HISTORY="$(fc -ln -10)";
		export TF_HISTORY;
		export PYTHONIOENCODING=utf-8;
		TF_CMD=$(
				thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
					) && eval $TF_CMD;
		unset TF_HISTORY;
		export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
		test -n "$TF_CMD" && print -s $TF_CMD
}

napf() {
	file=$(nap list | gum filter)
	if [[ $(echo "$file" | wc -c) > 0 ]]; then
		nap "$file"
	fi
}

man() {
	manres=$(/bin/man $1 | wc -l 2> /dev/null)
	helpres=$($1 --help)
	
	if [ $manres -eq "0" ]; then
		echo $helpres | less
	else
		/bin/man $1
	fi
}

localproxy() {
	export http_proxy="http://localhost:8080"
	export https_proxy="https://localhost:8080"
}

##
cd $HOME

## start x
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx
fi

source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

#clear
export PATH=$PATH:/home/james/.spicetify
