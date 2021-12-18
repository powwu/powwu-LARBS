# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# PATH
PATH="$GOPATH/bin/:$HOME/.local/bin/:$PATH"

# Aliases
alias hhkbmode='xmodmap -e "keycode 22 = grave" && xmodmap -e "keycode 49 = BackSpace"'
alias osumaps='mv ~/Downloads/*.osz ~/Games/osu/drive_c/osu/Songs/'
alias vpn='sudo openvpn --config owopenvpn-3.ovpn'
alias waifu2x=waifu2x-ncnn-vulkan
alias vc-enable="mv ~/.config/discord/* ~/.config/discord-temp/"
alias vc-disable="mv ~/.config/discord-temp/* ~/.config/discord/"
alias vc-clear="rm -rf ~/.config/discord-temp/*"
alias please='sudo $(fc -ln -1)'
alias brightness='xrandr --output DVI-D-0 --brightness'
alias rotate='xrandr --output DVI-D-0 --rotate'
alias refresh='sudo pkill -KILL -u james'
alias upload='curl bashupload.com -T'
alias vial=Vial
alias mic="pkill pulseaudio-equalizer && noisetorch -u && noisetorch -i" 
eval $(thefuck --alias)
copy() {
	echo "$1" | xclip -selection c
}

##
cd $HOME

## start x
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx
fi

