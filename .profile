
[ -e ~/.bashrc ] && . ~/.bashrc

if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]; then
    echo "display detected, waiting 5 seconds before starting wm... (^C to cancel)"
    sleep 5
    startx
fi
