#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [ -f $HOME/.Xmodmap ]; then
    /usr/bin/xmodmap $HOME/.Xmodmap
fi

envfile="$HOME/.gnupg/gpg-agent.env"
if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
    eval "$(cat "$envfile")"
else
    eval "$(gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile")"
fi
export GPG_AGENT_INFO  # the env file does not contain the export statement
export SSH_AUTH_SOCK   # enable gpg-agent for ssh

# exec openbox-session
# exec awesome
exec i3
# exec herbstluftwm
# 2bwm &
# exec terminator
# exec xmonad
# exec cinnamon-session
# exec startdde
# exec gnome-session
# exec startkde
# exec startlxqt
# exec startxfce4
# sxhkd &
# exec bspwm
# ...or the Window Manager of your choice
