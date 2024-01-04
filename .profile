
if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]; then
    startx
else
    [ -e ~/.bashrc ] && . ~/.bashrc
fi
