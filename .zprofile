export LANG=zh_CN.UTF-8
export LC_TIME=en_US.UTF-8
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export http_proxy=http://127.0.0.1:5234
export https_proxy=http://127.0.0.1:5234
export no_proxy="/var/run/docker.sock"
export GOPATH=~/.gogets:~/GOPATH
export GOBIN=~/bin
export VBOX_USB=usbfs
export PATH=$PATH:~/.gem/ruby/2.2.0/bin:~/bin:~/.linuxbrew/bin

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
