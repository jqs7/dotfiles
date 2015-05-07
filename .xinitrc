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

# exec openbox-session
# exec awesome
exec i3
# 2bwm &
# exec terminator
# exec xmonad
# exec cinnamon-session
# exec startdde
# exec gnome-session
# exec startkde
# exec startxfce4
# sxhkd &
# exec bspwm
# ...or the Window Manager of your choice
