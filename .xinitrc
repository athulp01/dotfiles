#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
userdefault=$HOME/.Xdefault

# merge in defaults and keymaps

xset +fp /home/athul/.local/share/fonts
xset fp rehash
setxkbmap -option caps:escape



if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
compton&
nitrogen --restore &
xautolock -time 5 -locker slock -corners ---- -secure -notify 30 -notifier "notify-send -u critical -t 10000 'LOCKING in 30s'" -detectsleep &
slstatus&
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# start i3 and keep it running
#if [ -f /usr/bin/i3 ]; then
#   while true; do
#	    exec i3 -c $HOME/.i3/config done fi
until dwm; do
    sleep 1
done
