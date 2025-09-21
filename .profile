
if [ -e ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ $(tty) = /dev/tty1 ]; then
    echo "display detected, waiting 3 seconds before starting wm... (^C to cancel)"
    sleep 3
    exec river
fi
