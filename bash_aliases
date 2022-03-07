#
#  _____  _____   ____   ____   ___   _   _  _____  _   _  _____ 
# |_   _|| ____| / ___| / ___| / _ \ | \_/ ||_   _|| \ | || ____|
#   | |  ||____ | |__  | |__  / /_\ \|     |  | |  |  \| |||____ 
#   | |  | ____| \__ \  \__ \ |  _  |||\ /||  | |  |     || ____|
#  _/ |  ||____  ___| | ___| || | | |||| ||| _| |_ | |\  |||____ 
# |__/   |_____||____/ |____/ |_| |_||||_||||_____||_| \_||_____|
#
# http://github.com/bbxenon
#
# aliases



alias refreshrc='source ~/.bashrc && echo "bashrc refreshed"'

alias aptup='sudo apt update && sudo apt upgrade'
alias aptin='sudo apt install'

alias lt='ls -AFhsS'
alias mkdir='mkdir -pv'
alias wget='wget -c'
alias lsblk='lsblk -e 7'

alias left='ls -tlh'
alias how-many='find . -type f | wc -l'

alias vi='vim'

alias grh='history|grep'
alias grl='ll|grep'

alias ..='cd ..'
alias cd..='cd ..'
alias cd~='cd ~'
alias cd-='cd -'
alias cde='cd ~/Code'
alias dls='cd ~/Downloads'
alias app='cd ~/Apps'

bup () 
{
	$ext=".bak";
	cp "$1$ext"
}

alias vopen='nautilus . 2>&1'
alias cpy='xclip -selection clipboard'
alias pwdcp='pwd | cpy'

up () 
{
	local d="";
	local limit="$1"

	if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
		limit=1
	fi

	for ((i=1;i<=limit;i++)); do
		d="../$d"
	done

	if ! cd "$d"; then
		echo "Couldn't go up $limit dirs"
	fi

}

function chp(){
	xdotool key --clearmodifiers Shift+F10 r $1
}

cl ()
{
	local d="$1"
	if [ $# -lt 1 ]; then
		d=$HOME
	fi
	if ! cd "$d"; then 
		echo "Couldn't find $d"
	else
		ls
	fi
}

mc ()
{
	local d="$1";
	if ! mkdir "$d"; then
		echo "Couldn't make $d"
	else
		cd "$1"
	fi
}

sbla () 
{
	if [ $# -eq 0 ]; then
		subl -n *
	elif [ $# -eq  1 ]; then
		local ext="$1";
		subl -n *.$ext
	elif [ $# -eq 2 ]; then
		local d="$1";
		local ext="$2";
		cd "$d";
		subl -n *.$ext
	fi
}

md5check ()
{
	local hash=$(xclip -o);
	md5sum "$1" | grep "$hash"
}

sha1check ()
{
	local hash=$(xclip -o);
	sha1sum "$1" | grep "$hash"
}

sha256check ()
{
	local hash=$(xclip -o);
	sha256sum "$1" | grep "$hash"
}

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
 else
    for n in $@
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

alias pull='git pull origin master -e --autostash'
alias cmt='git commit -m'
alias add='git add'
alias push='git push'

alias spyder='spyder </dev/null &> /dev/null &'

alias masters='conda activate masters-cf && cd ~/Code/python/Masters-Project; sbla jjmasters py; ..; spyder; pull'
alias OOP='cd ~/Code/cpp; code -n OOPCPP; cd OOPCPP'

alias showgpu='watch -d -n 1 nvidia-smi'
alias showip='dig +short myip.opendns.com resolver1.opendns.com|xargs echo "Public IP: $1"'
alias showmem='watch -d -n 3 free -mlt'
alias ps?='ps -aux | grep'

alias hacker-mode='cat /dev/urandom | hexdump -C | grep "bb 99"'

g++r ()
{
	g++ "$1" && ./a.out; \rm "a.out"
}

alias ascii='man ascii'
alias despace='rename "y/ /_/" *'
alias lowercase='rename "y/A-Z/a-z/" *'

alias edex-ui='app; ./eDEX-UI-Linux-x86_64.AppImage'
alias bwapp='app; ./Bitwarden-1.31.3-x86_64.AppImage'

alias pwgen='bw generate -cp --words 3 --includeNumber'
alias jpwgen='python ~/Code/python/scripts/password.py'

alias wttr='curl wttr.in'

randn ()
{
	if [ $# -eq 0 ]; then
		curl "https://www.random.org/integers/?num=1&min=1&max=10&col=1&base=10&format=plain&rnd=new"
	elif [ $# -eq 1 ]; then
		local beginning='https://www.random.org/integers/?num=';
		local ending='&min=1&max=10&col=1&base=10&format=plain&rnd=new';
		curl "$beginning$1$ending"
	elif [ $# -eq 2 ]; then 
		local beginning='https://www.random.org/integers/?num=1&min=';
		local ending='&col=1&base=10&format=plain&rnd=new';
		local max='&max=';
		curl "$beginning$1$max$2$ending"
	elif [ $# -eq 3 ]; then
		local beginning='https://www.random.org/integers/?num=';
		local ending='&col=1&base=10&format=plain&rnd=new';
		local min='&min=';
		local max='&max=';
		curl "$beginning$1$min$2$max$3$ending"
	fi
}


song-dl ()
{
	if [ $# -eq 0 ]; then
		local clipboard=$(xclip -o);
		youtube-dl -c -o '%(title)s.%(ext)s' -x --audio-format 'mp3' --audio-quality 1 "$clipboard"
	elif [ $# -eq 1 ]; then
		youtube-dl -c -o '%(title)s.%(ext)s' -x --audio-format 'mp3' --audio-quality 1 "$1"
	elif [ $# -eq 2 ]; then
		if [ "$1" -eq "file" ]; then
			youtube-dl -c -o '%(title)s.%(ext)s' -x --audio-format 'mp3' --audio-quality 1 -a "$2"
		fi
	fi
}
